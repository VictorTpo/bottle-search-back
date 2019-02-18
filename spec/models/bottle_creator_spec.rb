require 'rails_helper'

RSpec.describe BottleCreator, type: :model do
  describe '#save' do
    it 'can create bottles with good params' do
      params  = { name: 'Chateau Totor', vintage: 1989, purchased: 3, color: 'red' }
      creator = BottleCreator.new(params)
      expect(creator.valid?).to be(true)
      creator.save
      expect(Bottle.count).to eq(1)
      expect(Bottle.last.color).to eq('red')
    end

    it 'return false if a params is not correct' do
      params  = { name: 'Chateau Totor', vintage: 1989, color: 'blue' }
      creator = BottleCreator.new(params)
      expect(creator.valid?).to be(false)
      expect(Bottle.count).to eq(0)
    end
  end
end
