require "test_helper"

module UI
  module ActivityCalendar
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        date_range = (Date.new(2025, 1, 1)..Date.new(2025, 1, 1))
        render_inline(UI::ActivityCalendar::Component.new(date_range)) do |calendar|
          calendar.with_day.with_content("day content")
          calendar.with_day.with_content("day content")
        end

        assert_text I18n.t("date.abbr_month_names")[1].capitalize
        assert_text I18n.t("date.abbr_day_names")[1].capitalize
        assert_text I18n.t("date.abbr_day_names")[3].capitalize
        assert_text I18n.t("date.abbr_day_names")[5].capitalize
        assert_text "day content"
        assert_css "[data-controller='tooltip']", count: 2
      end
    end
  end
end
