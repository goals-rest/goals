require "test_helper"

module UI
  module Dropzone
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        render_inline(UI::Dropzone::Component.new) do |dropzone|
          dropzone.with_file_input
          dropzone.with_description.with_content("Dropzone description")
        end

        assert_text I18n.t("ui.dropzone.component.click_to_upload")
        assert_selector "input[type='file']"
        assert_text "Dropzone description"
      end
    end
  end
end
