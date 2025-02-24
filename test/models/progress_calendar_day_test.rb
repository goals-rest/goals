require "test_helper"

class ProgressCalendarDayTest < ActiveSupport::TestCase
  test "returns grade none if updates is equal to 0" do
    day = ProgressCalendarDay.new(date: Date.today, updates: 0)
    assert_equal :none, day.grade
  end

  test "returns grade few if updates is between 1 and 4" do
    (1..4).each do |updates|
      day = ProgressCalendarDay.new(date: Date.today, updates: updates)
      assert_equal :few, day.grade
    end
  end

  test "returns grade some if updates is between 5 and 9" do
    (5..9).each do |updates|
      day = ProgressCalendarDay.new(date: Date.today, updates: updates)
      assert_equal :some, day.grade
    end
  end

  test "returns grade moderate if updates is between 10 and 14" do
    (10..14).each do |updates|
      day = ProgressCalendarDay.new(date: Date.today, updates: updates)
      assert_equal :moderate, day.grade
    end
  end

  test "returns grade many if updates is between 15 and 20" do
    (15..20).each do |updates|
      day = ProgressCalendarDay.new(date: Date.today, updates: updates)
      assert_equal :many, day.grade
    end
  end

  test "returns grade intense if updates is greater than 20" do
    [ 21, 50, 100 ].each do |updates|
      day = ProgressCalendarDay.new(date: Date.today, updates: updates)
      assert_equal :intense, day.grade
    end
  end
end
