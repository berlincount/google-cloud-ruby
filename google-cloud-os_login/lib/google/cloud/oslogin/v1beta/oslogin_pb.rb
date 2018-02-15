# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/oslogin/v1beta/oslogin.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/cloud/oslogin/common_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.oslogin.v1beta.LoginProfile" do
    optional :name, :string, 1
    repeated :posix_accounts, :message, 2, "google.cloud.oslogin.common.PosixAccount"
    map :ssh_public_keys, :string, :message, 3, "google.cloud.oslogin.common.SshPublicKey"
    optional :suspended, :bool, 4
  end
  add_message "google.cloud.oslogin.v1beta.DeletePosixAccountRequest" do
    optional :name, :string, 1
  end
  add_message "google.cloud.oslogin.v1beta.DeleteSshPublicKeyRequest" do
    optional :name, :string, 1
  end
  add_message "google.cloud.oslogin.v1beta.GetLoginProfileRequest" do
    optional :name, :string, 1
  end
  add_message "google.cloud.oslogin.v1beta.GetSshPublicKeyRequest" do
    optional :name, :string, 1
  end
  add_message "google.cloud.oslogin.v1beta.ImportSshPublicKeyRequest" do
    optional :parent, :string, 1
    optional :ssh_public_key, :message, 2, "google.cloud.oslogin.common.SshPublicKey"
    optional :project_id, :string, 3
  end
  add_message "google.cloud.oslogin.v1beta.ImportSshPublicKeyResponse" do
    optional :login_profile, :message, 1, "google.cloud.oslogin.v1beta.LoginProfile"
  end
  add_message "google.cloud.oslogin.v1beta.UpdateSshPublicKeyRequest" do
    optional :name, :string, 1
    optional :ssh_public_key, :message, 2, "google.cloud.oslogin.common.SshPublicKey"
    optional :update_mask, :message, 3, "google.protobuf.FieldMask"
  end
end

module Google
  module Cloud
    module Oslogin
      module V1beta
        LoginProfile = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.LoginProfile").msgclass
        DeletePosixAccountRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.DeletePosixAccountRequest").msgclass
        DeleteSshPublicKeyRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.DeleteSshPublicKeyRequest").msgclass
        GetLoginProfileRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.GetLoginProfileRequest").msgclass
        GetSshPublicKeyRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.GetSshPublicKeyRequest").msgclass
        ImportSshPublicKeyRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.ImportSshPublicKeyRequest").msgclass
        ImportSshPublicKeyResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.ImportSshPublicKeyResponse").msgclass
        UpdateSshPublicKeyRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.oslogin.v1beta.UpdateSshPublicKeyRequest").msgclass
      end
    end
  end
end
