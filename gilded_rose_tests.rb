require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'minitest/autorun'

class TestUntitled < MiniTest::Unit::TestCase

  def test_foo
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].name, "foo"
  end

end
