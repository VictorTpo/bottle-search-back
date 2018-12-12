require 'rails_helper'

RSpec.describe BottleCreator, type: :model do
  context '#save' do
    it 'can create bottles with good params' do
      params  = { name: 'Chateau Totor', vintage: 1989, number: 3, color: 'red' }
      creator = BottleCreator.new(params)
      expect(creator.save).to be(true)
      expect(Bottle.count).to eq(3)
      expect(Bottle.last.color).to eq('red')
    end

    it 'return false if a params is not correct' do
      params  = { name: 'Chateau Totor', vintage: 1989, color: 'blue' }
      creator = BottleCreator.new(params)
      expect(creator.save).to be(false)
      expect(Bottle.count).to eq(0)
    end
  end
end
