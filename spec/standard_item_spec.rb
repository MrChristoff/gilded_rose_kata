describe StandardItem do

  describe "#update_quality" do
    it "does not change the name" do
      items = [StandardItem.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "decreases the quality value by 1" do
      items = [StandardItem.new("foo", 5, 10)]
      expect {(items[0]).update_quality}.to change {items[0].quality}.by(-1)
    end

    it "decreases the quality by 2 after the sell_in has reached 0" do
      items = [StandardItem.new("foo", 0, 10)]
      expect {(items)[0].update_quality}.to change {items[0].quality}.by(-2)
    end

    it "Quality of an item is never negative" do
      items = [StandardItem.new("foo", 0, 0)]
      expect {(items)[0].update_quality()}.not_to change {items[0].quality}
    end
  end
end
