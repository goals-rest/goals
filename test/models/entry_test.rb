require "test_helper"

class EntryTest < ActiveSupport::TestCase
  should belong_to(:owner)
end
