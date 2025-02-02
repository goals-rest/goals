require "test_helper"

module Goals
  module ProgressIndicator
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        progress_change = Goal::ProgressChange.new(old_value: 5, new_value: 10, target: 20)

        render_inline(Goals::ProgressIndicator::Component.new(progress_change:))

        assert_text 5
        assert_text 10
        assert_text 20
      end

      test "renders positive change" do
        progress_change = Goal::ProgressChange.new(old_value: 5, new_value: 10, target: 20)

        render_inline(Goals::ProgressIndicator::Component.new(progress_change:))

        assert_selector ".text-green-600"
      end

      test "renders negative change" do
        progress_change = Goal::ProgressChange.new(old_value: 10, new_value: 5, target: 20)

        render_inline(Goals::ProgressIndicator::Component.new(progress_change:))

        assert_selector ".text-red-600"
      end

      test "renders does not render icon when there is no change" do
        progress_change = Goal::ProgressChange.new(old_value: 5, new_value: 5, target: 20)

        render_inline(Goals::ProgressIndicator::Component.new(progress_change:))

        assert_no_selector "svg"
      end
    end
  end
end
