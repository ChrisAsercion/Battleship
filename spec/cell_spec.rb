require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  describe 'initialize' do
    it 'exists' do
      cell = Cell.new("B4")
      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to eq(nil)
      expect(cell.empty?).to eq(true)
    end
    
    it 'can place a ship' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end
end
