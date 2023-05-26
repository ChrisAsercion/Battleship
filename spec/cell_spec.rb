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
  end

  describe 'actions' do
    it 'can place a ship' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end

    it 'can be fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to eq(false)
      cell.fire_upon
      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end

  end
  describe 'render' do
    it 'can render the space' do
      cell_1 = Cell.new("B4")
      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      cell_2.fire_upon
      cell_2.fire_upon
      expect(cell_2.render).to eq("X")
    end
    it 'can show an optional text' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
    end
  end
end

#The cell will take a coordinate string
#@ship isn't defined until place_ship is called so it can return nil
#once place_ship is called, @ship is now the battleship piece that is assigned to it