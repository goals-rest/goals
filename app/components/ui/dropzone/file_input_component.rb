module UI
  module Dropzone
    class FileInputComponent < ApplicationComponent
      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def call
        tag.input(type: :file, id: "dropzone-file", class: "hidden", **attrs)
      end
    end
  end
end
