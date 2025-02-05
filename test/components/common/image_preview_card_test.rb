require "test_helper"

module ImagePreviewCard
  class ComponentTest < ViewComponent::TestCase
    test "renders the component" do
      render_inline(ImagePreviewCard::Component.new) do |card|
        card.with_image
        card.with_file_input
        card.with_hidden_input
      end

      assert_selector "img"
      assert_selector "input[type='file']"
      assert_selector "input[type='hidden']", visible: false
    end
  end
end
