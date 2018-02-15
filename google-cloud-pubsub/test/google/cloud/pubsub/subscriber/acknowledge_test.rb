# Copyright 2017 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "helper"

describe Google::Cloud::Pubsub::Subscriber, :acknowledge, :mock_pubsub do
  let(:topic_name) { "topic-name-goes-here" }
  let(:sub_name) { "subscription-name-goes-here" }
  let(:sub_json) { subscription_json topic_name, sub_name }
  let(:sub_hash) { JSON.parse sub_json }
  let(:sub_grpc) { Google::Pubsub::V1::Subscription.decode_json(sub_json) }
  let(:subscription) { Google::Cloud::Pubsub::Subscription.from_grpc sub_grpc, pubsub.service }
  let(:rec_msg1_grpc) { Google::Pubsub::V1::ReceivedMessage.decode_json \
                          rec_message_json("rec_message1-msg-goes-here", 1111) }
  let(:rec_msg2_grpc) { Google::Pubsub::V1::ReceivedMessage.decode_json \
                          rec_message_json("rec_message2-msg-goes-here", 1112) }
  let(:rec_msg3_grpc) { Google::Pubsub::V1::ReceivedMessage.decode_json \
                          rec_message_json("rec_message3-msg-goes-here", 1113) }

  it "can acknowledge a single message" do
    rec_message_msg = "pulled-message"
    rec_message_ack_id = 123456789
    pull_res = Google::Pubsub::V1::StreamingPullResponse.decode_json rec_messages_json(rec_message_msg, rec_message_ack_id)
    responses = [pull_res]

    stub = StreamingPullStub.new responses.each
    called = false

    subscription.service.mocked_subscriber = stub
    subscriber = subscription.listen streams: 1 do |result|
      assert_kind_of Google::Cloud::Pubsub::ReceivedMessage, result
      assert_equal rec_message_msg, result.data
      assert_equal "ack-id-#{rec_message_ack_id}", result.ack_id

      result.ack!
      called = true
    end
    subscriber.start

    subscriber_retries = 0
    while !called
      fail "total number of calls were never made" if subscriber_retries > 100
      subscriber_retries += 1
      sleep 0.01
    end

    subscriber.stop
    subscriber.wait!
  end

  it "can acknowledge multiple messages" do
    pull_res = Google::Pubsub::V1::StreamingPullResponse.new received_messages: [rec_msg1_grpc, rec_msg2_grpc, rec_msg3_grpc]
    responses = [pull_res]

    stub = StreamingPullStub.new responses.each
    called = 0

    subscription.service.mocked_subscriber = stub
    subscriber = subscription.listen streams: 1 do |msg|
      assert_kind_of Google::Cloud::Pubsub::ReceivedMessage, msg
      msg.ack!
      called +=1
    end
    subscriber.start

    subscriber_retries = 0
    while called < 3
      fail "total number of calls were never made" if subscriber_retries > 100
      subscriber_retries += 1
      sleep 0.01
    end

    subscriber.stop
    subscriber.wait!
  end
end
