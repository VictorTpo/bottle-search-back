require 'rails_helper'

RSpec.describe BottleFinder, type: :model do
  context '#call' do
    before do
      Bottle.create(name: 'Chateau Totor',  vintage: 1989, box_id: 1, color: 'red', offerer: 'Patrice', purchase_occasion: 'For my birthday')
      Bottle.create(name: 'Chateau Totor',  vintage: 1989, box_id: 1, color: 'red', offerer: 'Patrice', purchase_occasion: 'For my birthday')
      Bottle.create(name: 'Chateau Totor',  vintage: 1989, box_id: 1, color: 'red', offerer: 'Patrice', purchase_occasion: 'For my birthday')
      Bottle.create(name: 'Chateau Margot', vintage: 1991, box_id: 2, color: 'white')
      Bottle.create(name: 'Chateau Margot', vintage: 1991, box_id: 2, color: 'white')
      Bottle.create(name: 'Domaine Emma',   vintage: 1999, box_id: 3, color: 'pink', description: 'Perfect for a birthday')
      Bottle.create(name: 'Domaine G33k',   vintage: 1989, box_id: 4, color: 'white', taste_description: 'Good with a birthday cake!!!')
      Bottle.create(name: 'Château DuCon',  vintage: 1989, box_id: 5)
    end

    it 'return all if no params' do
      params = {}
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(Bottle.select(:box_id).distinct.count)
    end

    it 'can search in color' do
      params = { color: 'white' }
      search = BottleFinder.new(params)
      search.call
      expect(search.total).to eq(2)
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

    it 'return a correct bottles number' do
      params = { color: 'white' }
      search = BottleFinder.new(params)
      search.call
      expect(search.bottles_number).to eq(3)
    end
  end
end
