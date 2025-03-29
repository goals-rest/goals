require "test_helper"

class HandleTextParserTest < ActiveSupport::TestCase
  test "parses handles from text" do
    text = "Hello @user, @user2."
    handles = HandleTextParser.new(text).parse

    assert_equal [ Handle.new("@user"), Handle.new("@user2") ], handles
  end
end
