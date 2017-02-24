require File.join(File.dirname(__FILE__), 'gilded_rose')

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


  end

end
