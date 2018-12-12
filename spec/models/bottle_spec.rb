require 'rails_helper'

RSpec.describe Bottle, type: :model do
  it 'cannot be create if some params are missing' do
    b = Bottle.new(name: 'Chateau Totor')
    expect(b.save).to be(false)
  end

  it 'can be create with all params' do
    b = Bottle.new(name: 'Chateau Totor',
                   vintage: 1989)
    expect(b.save).to be(true)
  end

  it 'increment box_id' do
    b1 = Bottle.create(name: 'Chateau Totor', vintage: 1989)
    expect(b1.box_id).to eq(1)
    Bottle.create(name: 'Chateau Margot', vintage: 1991, box_id: 6)
    Bottle.create(name: 'Chateau Margot', vintage: 1991, box_id: 6)
    b2 = Bottle.create(name: 'Chateau Emma', vintage: 1999)
    expect(b2.box_id).to eq(7)
  end
end
