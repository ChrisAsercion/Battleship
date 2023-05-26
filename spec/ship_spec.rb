require './lib/ship'

RSpec.describe Ship do
  describe 'initialize' do
    it 'exists' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser).to be_a(Ship)
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
      expect(cruiser.health).to eq(3)
      expect(cruiser.sunk?).to eq(false)
    end

    it 'starts at full health' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.health).to eq(3)
      expect(cruiser.hit_counter).to eq(0)
    end

    it 'can take a hit' do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
      expect(cruiser.hit_counter).to eq(1)
      cruiser.hit
      cruiser.hit
      expect(cruiser.health).to eq(0)
      expect(cruiser.hit_counter).to eq(3)
      expect(cruiser.sunk?).to eq(true)
    end
  end
end