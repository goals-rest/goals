require "test_helper"

module UI
  module ProgressCalendar
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        progress_calendar = ::ProgressCalendar.new(
          [
            ProgressCalendarDay.new(
              date: Date.new(2025, 1, 1),
              updates: 1000
            ),
            ProgressCalendarDay.new(
              date: Date.new(2025, 1, 2),
              updates: 2
            )
          ]
        )

        render_inline(UI::ProgressCalendar::Component.new(progress_calendar:))

        expected_date = I18n.localize(Date.new(2025, 1, 1), format: :short_month)

        assert_text I18n.t("date.abbr_month_names")[1].capitalize
        assert_text I18n.t("date.abbr_day_names")[1].capitalize
        assert_text I18n.t("date.abbr_day_names")[3].capitalize
        assert_text I18n.t("date.abbr_day_names")[5].capitalize
        assert_text I18n.t("ui.progress_calendar.day_component.updates", count: 1000, date: expected_date)
        assert_css "[data-controller='tooltip']", count: 2
      end
    end
  end
end
