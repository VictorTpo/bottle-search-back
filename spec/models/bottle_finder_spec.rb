require 'rails_helper'

RSpec.describe BottleFinder, type: :model do
  describe '#call' do
    before do
      Bottle.create(name: 'Chateau Totor',  vintage: 1989, purchased: 3, color: 'red', offerer: 'Patrice', purchase_occasion: 'For my birthday')
      Bottle.create(name: 'Chateau Margot', vintage: 1991, purchased: 2, stored: 0, color: 'white')
      Bottle.create(name: 'Domaine Emma',   vintage: 1999, color: 'pink', description: 'Perfect for a birthday')
      Bottle.create(name: 'Domaine G33k',   vintage: 1989, purchased: 3, stored: 2, color: 'white', taste_description: 'Good with a birthday cake!!!')
      Bottle.create(name: 'Château DuCon',  vintage: 1989, purchased: 4, stored: 3, color: 'white') # with accent
    end

    it 'return all if no params' do
      params = {}
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(Bottle.count)
    end

    it 'can search in color' do
      params = { color: 'white' }
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(3)
    end

    it 'can search in vintage' do
      params = { vintage: 1989 }
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(3)
    end

    it 'can search in both color and vintage' do
      params = { vintage: 1989, color: 'red' }
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(1)
    end

    it 'can search in name' do
      params = { text: 'Chateau' }
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(3)
    end

    it 'can search in descriptionS' do
      params = { text: 'birthday' }
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(3)
    end

    it 'return a correct remainging count' do
      params = { color: 'white' }
      search = BottleFinder.new(params)
      search.call
      expect(search.remaining_count).to eq(2)
    end

    it 'return a correct bottles remainging' do
      params = { color: 'white' }
      search = BottleFinder.new(params)
      search.call
      expect(search.bottles_count).to eq(5)
    end
  end
end
