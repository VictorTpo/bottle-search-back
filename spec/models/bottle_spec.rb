require 'rails_helper'

RSpec.describe Bottle, type: :model do
  it 'cannot be create if some params are missing' do
    b = Bottle.new(name: 'Chateau Totor')
    expect(b.save).to eq(false)
  end

  it 'can be create with all params' do
    b = Bottle.new(name: 'Chateau Totor',
                   vintage: 1989, stored: 2)
    expect(b.save).to eq(true)
  end

  it 'have correct default attributes' do
    b = Bottle.create(name: 'Chateau Totor',
                      vintage: 1989)
    expect(b.purchased).to  eq(1)
    expect(b.stored).to     eq(1)
    expect(b.sparkling).to  eq(false)
  end
end
