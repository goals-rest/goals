require "test_helper"

class Entry::ContentParserTest < ActiveSupport::TestCase
  test "parses text" do
    entry = create(:entry, entryable: create(:post, body: "Hello, world!"))

    fragments = Entry::ContentParser.new(entry).parse

    assert_equal 1, fragments.size
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments.first.type
    assert_equal "Hello, world!", fragments.first.value
  end

  test "parses handle" do
    entry = create(:entry, entryable: create(:post, body: "Hello, @john.doe!"))

    fragments = Entry::ContentParser.new(entry).parse

    assert_equal 3, fragments.size
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments[0].type
    assert_equal "Hello, ", fragments[0].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:handle], fragments[1].type
    assert_equal "@john.doe", fragments[1].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments[2].type
    assert_equal "!", fragments[2].value
  end

  test "parses multiple handles" do
    entry = create(:entry, entryable: create(:post, body: "Hello, @john.doe and @jane.doe!"))

    fragments = Entry::ContentParser.new(entry).parse

    assert_equal 5, fragments.size
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments[0].type
    assert_equal "Hello, ", fragments[0].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:handle], fragments[1].type
    assert_equal "@john.doe", fragments[1].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments[2].type
    assert_equal " and ", fragments[2].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:handle], fragments[3].type
    assert_equal "@jane.doe", fragments[3].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments[4].type
    assert_equal "!", fragments[4].value
  end

  test "parses handle at the end" do
    entry = create(:entry, entryable: create(:post, body: "Hello, @john.doe"))

    fragments = Entry::ContentParser.new(entry).parse

    assert_equal 2, fragments.size
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments[0].type
    assert_equal "Hello, ", fragments[0].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:handle], fragments[1].type
    assert_equal "@john.doe", fragments[1].value
  end

  test "parses handle at the beginning" do
    entry = create(:entry, entryable: create(:post, body: "@john.doe, hello!"))

    fragments = Entry::ContentParser.new(entry).parse

    assert_equal 2, fragments.size
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:handle], fragments[0].type
    assert_equal "@john.doe", fragments[0].value
    assert_equal Entry::Fragment::FRAGMENT_TYPE[:text], fragments[1].type
    assert_equal ", hello!", fragments[1].value
  end
end
