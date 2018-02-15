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

module Google
  module Firestore
    module V1beta1
      # A write on a document.
      # @!attribute [rw] update
      #   @return [Google::Firestore::V1beta1::Document]
      #     A document to write.
      # @!attribute [rw] delete
      #   @return [String]
      #     A document name to delete. In the format:
      #     +projects/{project_id}/databases/{database_id}/documents/{document_path}+.
      # @!attribute [rw] transform
      #   @return [Google::Firestore::V1beta1::DocumentTransform]
      #     Applies a tranformation to a document.
      #     At most one +transform+ per document is allowed in a given request.
      #     An +update+ cannot follow a +transform+ on the same document in a given
      #     request.
      # @!attribute [rw] update_mask
      #   @return [Google::Firestore::V1beta1::DocumentMask]
      #     The fields to update in this write.
      #
      #     This field can be set only when the operation is +update+.
      #     None of the field paths in the mask may contain a reserved name.
      #     If the document exists on the server and has fields not referenced in the
      #     mask, they are left unchanged.
      #     Fields referenced in the mask, but not present in the input document, are
      #     deleted from the document on the server.
      #     The field paths in this mask must not contain a reserved field name.
      # @!attribute [rw] current_document
      #   @return [Google::Firestore::V1beta1::Precondition]
      #     An optional precondition on the document.
      #
      #     The write will fail if this is set and not met by the target document.
      class Write; end

      # A transformation of a document.
      # @!attribute [rw] document
      #   @return [String]
      #     The name of the document to transform.
      # @!attribute [rw] field_transforms
      #   @return [Array<Google::Firestore::V1beta1::DocumentTransform::FieldTransform>]
      #     The list of transformations to apply to the fields of the document, in
      #     order.
      class DocumentTransform
        # A transformation of a field of the document.
        # @!attribute [rw] field_path
        #   @return [String]
        #     The path of the field. See {Google::Firestore::V1beta1::Document#fields Document#fields} for the field path syntax
        #     reference.
        # @!attribute [rw] set_to_server_value
        #   @return [Google::Firestore::V1beta1::DocumentTransform::FieldTransform::ServerValue]
        #     Sets the field to the given server value.
        class FieldTransform
          # A value that is calculated by the server.
          module ServerValue
            # Unspecified. This value must not be used.
            SERVER_VALUE_UNSPECIFIED = 0

            # The time at which the server processed the request.
            REQUEST_TIME = 1
          end
        end
      end

      # The result of applying a write.
      # @!attribute [rw] update_time
      #   @return [Google::Protobuf::Timestamp]
      #     The last update time of the document after applying the write. Not set
      #     after a +delete+.
      #
      #     If the write did not actually change the document, this will be the
      #     previous update_time.
      # @!attribute [rw] transform_results
      #   @return [Array<Google::Firestore::V1beta1::Value>]
      #     The results of applying each {Google::Firestore::V1beta1::DocumentTransform::FieldTransform DocumentTransform::FieldTransform}, in the
      #     same order.
      class WriteResult; end

      # A {Google::Firestore::V1beta1::Document Document} has changed.
      #
      # May be the result of multiple {Google::Firestore::V1beta1::Write Writes}, including deletes, that
      # ultimately resulted in a new value for the {Google::Firestore::V1beta1::Document Document}.
      #
      # Multiple {Google::Firestore::V1beta1::DocumentChange DocumentChange} messages may be returned for the same logical
      # change, if multiple targets are affected.
      # @!attribute [rw] document
      #   @return [Google::Firestore::V1beta1::Document]
      #     The new state of the {Google::Firestore::V1beta1::Document Document}.
      #
      #     If +mask+ is set, contains only fields that were updated or added.
      # @!attribute [rw] target_ids
      #   @return [Array<Integer>]
      #     A set of target IDs of targets that match this document.
      # @!attribute [rw] removed_target_ids
      #   @return [Array<Integer>]
      #     A set of target IDs for targets that no longer match this document.
      class DocumentChange; end

      # A {Google::Firestore::V1beta1::Document Document} has been deleted.
      #
      # May be the result of multiple {Google::Firestore::V1beta1::Write Writes}, including updates, the
      # last of which deleted the {Google::Firestore::V1beta1::Document Document}.
      #
      # Multiple {Google::Firestore::V1beta1::DocumentDelete DocumentDelete} messages may be returned for the same logical
      # delete, if multiple targets are affected.
      # @!attribute [rw] document
      #   @return [String]
      #     The resource name of the {Google::Firestore::V1beta1::Document Document} that was deleted.
      # @!attribute [rw] removed_target_ids
      #   @return [Array<Integer>]
      #     A set of target IDs for targets that previously matched this entity.
      # @!attribute [rw] read_time
      #   @return [Google::Protobuf::Timestamp]
      #     The read timestamp at which the delete was observed.
      #
      #     Greater or equal to the +commit_time+ of the delete.
      class DocumentDelete; end

      # A {Google::Firestore::V1beta1::Document Document} has been removed from the view of the targets.
      #
      # Sent if the document is no longer relevant to a target and is out of view.
      # Can be sent instead of a DocumentDelete or a DocumentChange if the server
      # can not send the new value of the document.
      #
      # Multiple {Google::Firestore::V1beta1::DocumentRemove DocumentRemove} messages may be returned for the same logical
      # write or delete, if multiple targets are affected.
      # @!attribute [rw] document
      #   @return [String]
      #     The resource name of the {Google::Firestore::V1beta1::Document Document} that has gone out of view.
      # @!attribute [rw] removed_target_ids
      #   @return [Array<Integer>]
      #     A set of target IDs for targets that previously matched this document.
      # @!attribute [rw] read_time
      #   @return [Google::Protobuf::Timestamp]
      #     The read timestamp at which the remove was observed.
      #
      #     Greater or equal to the +commit_time+ of the change/delete/remove.
      class DocumentRemove; end

      # A digest of all the documents that match a given target.
      # @!attribute [rw] target_id
      #   @return [Integer]
      #     The target ID to which this filter applies.
      # @!attribute [rw] count
      #   @return [Integer]
      #     The total count of documents that match {Google::Firestore::V1beta1::ExistenceFilter#target_id Target_id}.
      #
      #     If different from the count of documents in the client that match, the
      #     client must manually determine which documents no longer match the target.
      class ExistenceFilter; end
    end
  end
end