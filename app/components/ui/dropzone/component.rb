module UI
  module Dropzone
    class Component < ApplicationComponent
      renders_one :file_input, UI::Dropzone::FileInputComponent
      renders_one :description

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      private
      def default_attrs
        {
          class: "flex items-center justify-center w-full"
        }
      end
    end
  end
end
