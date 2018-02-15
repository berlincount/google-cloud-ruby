# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/vision/v1/image_annotator.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/cloud/vision/v1/geometry_pb'
require 'google/cloud/vision/v1/text_annotation_pb'
require 'google/cloud/vision/v1/web_detection_pb'
require 'google/rpc/status_pb'
require 'google/type/color_pb'
require 'google/type/latlng_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.vision.v1.Feature" do
    optional :type, :enum, 1, "google.cloud.vision.v1.Feature.Type"
    optional :max_results, :int32, 2
    optional :model, :string, 3
  end
  add_enum "google.cloud.vision.v1.Feature.Type" do
    value :TYPE_UNSPECIFIED, 0
    value :FACE_DETECTION, 1
    value :LANDMARK_DETECTION, 2
    value :LOGO_DETECTION, 3
    value :LABEL_DETECTION, 4
    value :TEXT_DETECTION, 5
    value :DOCUMENT_TEXT_DETECTION, 11
    value :SAFE_SEARCH_DETECTION, 6
    value :IMAGE_PROPERTIES, 7
    value :CROP_HINTS, 9
    value :WEB_DETECTION, 10
  end
  add_message "google.cloud.vision.v1.ImageSource" do
    optional :gcs_image_uri, :string, 1
    optional :image_uri, :string, 2
  end
  add_message "google.cloud.vision.v1.Image" do
    optional :content, :bytes, 1
    optional :source, :message, 2, "google.cloud.vision.v1.ImageSource"
  end
  add_message "google.cloud.vision.v1.FaceAnnotation" do
    optional :bounding_poly, :message, 1, "google.cloud.vision.v1.BoundingPoly"
    optional :fd_bounding_poly, :message, 2, "google.cloud.vision.v1.BoundingPoly"
    repeated :landmarks, :message, 3, "google.cloud.vision.v1.FaceAnnotation.Landmark"
    optional :roll_angle, :float, 4
    optional :pan_angle, :float, 5
    optional :tilt_angle, :float, 6
    optional :detection_confidence, :float, 7
    optional :landmarking_confidence, :float, 8
    optional :joy_likelihood, :enum, 9, "google.cloud.vision.v1.Likelihood"
    optional :sorrow_likelihood, :enum, 10, "google.cloud.vision.v1.Likelihood"
    optional :anger_likelihood, :enum, 11, "google.cloud.vision.v1.Likelihood"
    optional :surprise_likelihood, :enum, 12, "google.cloud.vision.v1.Likelihood"
    optional :under_exposed_likelihood, :enum, 13, "google.cloud.vision.v1.Likelihood"
    optional :blurred_likelihood, :enum, 14, "google.cloud.vision.v1.Likelihood"
    optional :headwear_likelihood, :enum, 15, "google.cloud.vision.v1.Likelihood"
  end
  add_message "google.cloud.vision.v1.FaceAnnotation.Landmark" do
    optional :type, :enum, 3, "google.cloud.vision.v1.FaceAnnotation.Landmark.Type"
    optional :position, :message, 4, "google.cloud.vision.v1.Position"
  end
  add_enum "google.cloud.vision.v1.FaceAnnotation.Landmark.Type" do
    value :UNKNOWN_LANDMARK, 0
    value :LEFT_EYE, 1
    value :RIGHT_EYE, 2
    value :LEFT_OF_LEFT_EYEBROW, 3
    value :RIGHT_OF_LEFT_EYEBROW, 4
    value :LEFT_OF_RIGHT_EYEBROW, 5
    value :RIGHT_OF_RIGHT_EYEBROW, 6
    value :MIDPOINT_BETWEEN_EYES, 7
    value :NOSE_TIP, 8
    value :UPPER_LIP, 9
    value :LOWER_LIP, 10
    value :MOUTH_LEFT, 11
    value :MOUTH_RIGHT, 12
    value :MOUTH_CENTER, 13
    value :NOSE_BOTTOM_RIGHT, 14
    value :NOSE_BOTTOM_LEFT, 15
    value :NOSE_BOTTOM_CENTER, 16
    value :LEFT_EYE_TOP_BOUNDARY, 17
    value :LEFT_EYE_RIGHT_CORNER, 18
    value :LEFT_EYE_BOTTOM_BOUNDARY, 19
    value :LEFT_EYE_LEFT_CORNER, 20
    value :RIGHT_EYE_TOP_BOUNDARY, 21
    value :RIGHT_EYE_RIGHT_CORNER, 22
    value :RIGHT_EYE_BOTTOM_BOUNDARY, 23
    value :RIGHT_EYE_LEFT_CORNER, 24
    value :LEFT_EYEBROW_UPPER_MIDPOINT, 25
    value :RIGHT_EYEBROW_UPPER_MIDPOINT, 26
    value :LEFT_EAR_TRAGION, 27
    value :RIGHT_EAR_TRAGION, 28
    value :LEFT_EYE_PUPIL, 29
    value :RIGHT_EYE_PUPIL, 30
    value :FOREHEAD_GLABELLA, 31
    value :CHIN_GNATHION, 32
    value :CHIN_LEFT_GONION, 33
    value :CHIN_RIGHT_GONION, 34
  end
  add_message "google.cloud.vision.v1.LocationInfo" do
    optional :lat_lng, :message, 1, "google.type.LatLng"
  end
  add_message "google.cloud.vision.v1.Property" do
    optional :name, :string, 1
    optional :value, :string, 2
    optional :uint64_value, :uint64, 3
  end
  add_message "google.cloud.vision.v1.EntityAnnotation" do
    optional :mid, :string, 1
    optional :locale, :string, 2
    optional :description, :string, 3
    optional :score, :float, 4
    optional :confidence, :float, 5
    optional :topicality, :float, 6
    optional :bounding_poly, :message, 7, "google.cloud.vision.v1.BoundingPoly"
    repeated :locations, :message, 8, "google.cloud.vision.v1.LocationInfo"
    repeated :properties, :message, 9, "google.cloud.vision.v1.Property"
  end
  add_message "google.cloud.vision.v1.SafeSearchAnnotation" do
    optional :adult, :enum, 1, "google.cloud.vision.v1.Likelihood"
    optional :spoof, :enum, 2, "google.cloud.vision.v1.Likelihood"
    optional :medical, :enum, 3, "google.cloud.vision.v1.Likelihood"
    optional :violence, :enum, 4, "google.cloud.vision.v1.Likelihood"
    optional :racy, :enum, 9, "google.cloud.vision.v1.Likelihood"
  end
  add_message "google.cloud.vision.v1.LatLongRect" do
    optional :min_lat_lng, :message, 1, "google.type.LatLng"
    optional :max_lat_lng, :message, 2, "google.type.LatLng"
  end
  add_message "google.cloud.vision.v1.ColorInfo" do
    optional :color, :message, 1, "google.type.Color"
    optional :score, :float, 2
    optional :pixel_fraction, :float, 3
  end
  add_message "google.cloud.vision.v1.DominantColorsAnnotation" do
    repeated :colors, :message, 1, "google.cloud.vision.v1.ColorInfo"
  end
  add_message "google.cloud.vision.v1.ImageProperties" do
    optional :dominant_colors, :message, 1, "google.cloud.vision.v1.DominantColorsAnnotation"
  end
  add_message "google.cloud.vision.v1.CropHint" do
    optional :bounding_poly, :message, 1, "google.cloud.vision.v1.BoundingPoly"
    optional :confidence, :float, 2
    optional :importance_fraction, :float, 3
  end
  add_message "google.cloud.vision.v1.CropHintsAnnotation" do
    repeated :crop_hints, :message, 1, "google.cloud.vision.v1.CropHint"
  end
  add_message "google.cloud.vision.v1.CropHintsParams" do
    repeated :aspect_ratios, :float, 1
  end
  add_message "google.cloud.vision.v1.WebDetectionParams" do
    optional :include_geo_results, :bool, 2
  end
  add_message "google.cloud.vision.v1.ImageContext" do
    optional :lat_long_rect, :message, 1, "google.cloud.vision.v1.LatLongRect"
    repeated :language_hints, :string, 2
    optional :crop_hints_params, :message, 4, "google.cloud.vision.v1.CropHintsParams"
    optional :web_detection_params, :message, 6, "google.cloud.vision.v1.WebDetectionParams"
  end
  add_message "google.cloud.vision.v1.AnnotateImageRequest" do
    optional :image, :message, 1, "google.cloud.vision.v1.Image"
    repeated :features, :message, 2, "google.cloud.vision.v1.Feature"
    optional :image_context, :message, 3, "google.cloud.vision.v1.ImageContext"
  end
  add_message "google.cloud.vision.v1.AnnotateImageResponse" do
    repeated :face_annotations, :message, 1, "google.cloud.vision.v1.FaceAnnotation"
    repeated :landmark_annotations, :message, 2, "google.cloud.vision.v1.EntityAnnotation"
    repeated :logo_annotations, :message, 3, "google.cloud.vision.v1.EntityAnnotation"
    repeated :label_annotations, :message, 4, "google.cloud.vision.v1.EntityAnnotation"
    repeated :text_annotations, :message, 5, "google.cloud.vision.v1.EntityAnnotation"
    optional :full_text_annotation, :message, 12, "google.cloud.vision.v1.TextAnnotation"
    optional :safe_search_annotation, :message, 6, "google.cloud.vision.v1.SafeSearchAnnotation"
    optional :image_properties_annotation, :message, 8, "google.cloud.vision.v1.ImageProperties"
    optional :crop_hints_annotation, :message, 11, "google.cloud.vision.v1.CropHintsAnnotation"
    optional :web_detection, :message, 13, "google.cloud.vision.v1.WebDetection"
    optional :error, :message, 9, "google.rpc.Status"
  end
  add_message "google.cloud.vision.v1.BatchAnnotateImagesRequest" do
    repeated :requests, :message, 1, "google.cloud.vision.v1.AnnotateImageRequest"
  end
  add_message "google.cloud.vision.v1.BatchAnnotateImagesResponse" do
    repeated :responses, :message, 1, "google.cloud.vision.v1.AnnotateImageResponse"
  end
  add_enum "google.cloud.vision.v1.Likelihood" do
    value :UNKNOWN, 0
    value :VERY_UNLIKELY, 1
    value :UNLIKELY, 2
    value :POSSIBLE, 3
    value :LIKELY, 4
    value :VERY_LIKELY, 5
  end
end

module Google
  module Cloud
    module Vision
      module V1
        Feature = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.Feature").msgclass
        Feature::Type = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.Feature.Type").enummodule
        ImageSource = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.ImageSource").msgclass
        Image = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.Image").msgclass
        FaceAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.FaceAnnotation").msgclass
        FaceAnnotation::Landmark = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.FaceAnnotation.Landmark").msgclass
        FaceAnnotation::Landmark::Type = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.FaceAnnotation.Landmark.Type").enummodule
        LocationInfo = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.LocationInfo").msgclass
        Property = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.Property").msgclass
        EntityAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.EntityAnnotation").msgclass
        SafeSearchAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.SafeSearchAnnotation").msgclass
        LatLongRect = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.LatLongRect").msgclass
        ColorInfo = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.ColorInfo").msgclass
        DominantColorsAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.DominantColorsAnnotation").msgclass
        ImageProperties = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.ImageProperties").msgclass
        CropHint = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.CropHint").msgclass
        CropHintsAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.CropHintsAnnotation").msgclass
        CropHintsParams = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.CropHintsParams").msgclass
        WebDetectionParams = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.WebDetectionParams").msgclass
        ImageContext = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.ImageContext").msgclass
        AnnotateImageRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.AnnotateImageRequest").msgclass
        AnnotateImageResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.AnnotateImageResponse").msgclass
        BatchAnnotateImagesRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.BatchAnnotateImagesRequest").msgclass
        BatchAnnotateImagesResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.BatchAnnotateImagesResponse").msgclass
        Likelihood = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.Likelihood").enummodule
      end
    end
  end
end
