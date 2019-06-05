require 'glided_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "Aged Brie increases in Quality the older it gets" do
      items = [Item.new("Aged Brie", 2, 0)]
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end

    it "Sulfuras never has to be sold or decreases in Quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 80)]
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 80
    end

    it "Backstage passes quality drops to 0 after the concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 20)]
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

end
