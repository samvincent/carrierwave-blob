# encoding: utf-8

module CarrierWave
  module Storage

    class Blob < Abstract
      class Content
        def initialize(content)
          @content = content
        end

        def url(options={})
          @content
        end

        def to_s
          @content
        end

        def content_type
          @content.scan(/\Adata:(.+);base64/).flatten.pop
        end

        def delete
          # Nothing required here
        end
      end

      def store!(file)
        type = uploader.file.content_type
        blob = Base64.encode64(self.uploader.file.read)
        uploader.model.update_columns self.uploader.mounted_as => "data:#{type};base64,#{blob}"
      end

      def retrieve!(identifier=nil)
        Content.new uploader.model.read_attribute(self.uploader.mounted_as)
      end
    end

  end
end

class CarrierWaveBlobRailtie < Rails::Railtie
  generators do
    require 'carrierwave-blob-generator'
  end
end
