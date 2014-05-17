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
      end

      def store!(file)
        # require "pry"; binding.pry
        type = uploader.file.content_type
        blob = Base64.encode64(self.uploader.file.read)
        uploader.model.update_columns picture: "data:#{type};base64,#{blob}"
      end

      def retrieve!(identifier=nil)
        Content.new uploader.model.read_attribute(:picture)
      end
    end

  end
end
