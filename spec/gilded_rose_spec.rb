# require File.join(File.dirname(__FILE__), 'gilded_rose')
require_relative '../lib/gilded_rose.rb'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "decreases the quality value by 1" do
      items = [Item.new("foo", 5, 10)]
      expect {GildedRose.new(items).update_quality}.to change {items[0].quality}.by(-1)
    end

    it "decreases the quality by 2 after the sell_in has reached 0" do
      items = [Item.new("foo", 0, 10)]
      expect {GildedRose.new(items).update_quality}.to change {items[0].quality}.by(-2)
    end

    it "Quality of an item is never negative" do
      items = [Item.new("foo", 0, 0)]
      expect {GildedRose.new(items).update_quality()}.not_to change {items[0].quality}
    end

    it "Quality of 'Aged Brie' increases by 1 before sell_in reaches 0" do
      items = [Item.new("Aged Brie", 5, 5)]
      expect {GildedRose.new(items).update_quality()}.to change {items[0].quality}.by(1)
    end

    it "Quality of 'Aged Brie' increases by 2 after sell_in reaches 0" do
      items = [Item.new("Aged Brie", 0, 5)]
      expect {GildedRose.new(items).update_quality()}.to change {items[0].quality}.by(2)
    end

    it "Quality never goes above 50" do
      items = [Item.new("Aged Brie", 0, 50)]
      expect {GildedRose.new(items).update_quality()}.not_to change {items[0].quality}
    end

    it "'Sulfuras, Hand of Ragnaros', sell_in does not change" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 50)]
      expect {GildedRose.new(items).update_quality()}.not_to change {items[0].sell_in}
    end

    it "'Sulfuras, Hand of Ragnaros', quality does not change" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 50)]
      expect {GildedRose.new(items).update_quality()}.not_to change {items[0].quality}
    end

    it "Backstage passes increases in quality by 1 when sell_in is greater than 10" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
      expect {GildedRose.new(items).update_quality()}.to change {items[0].quality}.by(1)
    end

    it "Backstage passes increases in quality by 2 when sell_in is less than 11" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      expect {GildedRose.new(items).update_quality()}.to change {items[0].quality}.by(2)
    end

    it "Backstage passes increases in quality by 3 when sell_in is less than 6" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      expect {GildedRose.new(items).update_quality()}.to change {items[0].quality}.by(3)
    end

    it "Backstage passes quality drops to 0 when sell_in is 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end

end
