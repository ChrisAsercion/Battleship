require './lib/ship'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_a(Ship)
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)
    expect(cruiser.sunk?).to eq(false)
  end
end