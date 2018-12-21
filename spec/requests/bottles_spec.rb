require 'rails_helper'

RSpec.describe 'Bottle endpoint', type: :request do
  # GET /bottles/:id
  describe '#show' do
    let(:bottle) { FactoryBot.create(:bottle, description: 'lorem ipsum') }

    it 'returns Bottle informations and status code 200' do
      get "/bottles/#{bottle.id}"
      expect(response).to be_successful
      expect(json_body).not_to be_empty
      expect(json_body['bottle']['description']).to eq('lorem ipsum')
    end
  end

  # POST /bottles/search
  describe '#search' do
    before do
      Bottle.create(name: 'Chateau Totor',  vintage: 1989, purchased: 3, color: 'red', offerer: 'Patrice', purchase_occasion: 'For my birthday')
      Bottle.create(name: 'Chateau Margot', vintage: 1991, purchased: 2, stored: 0, color: 'white')
      Bottle.create(name: 'Domaine Emma',   vintage: 1999, color: 'pink', description: 'Perfect for a birthday')
      Bottle.create(name: 'Domaine G33k',   vintage: 1989, purchased: 3, stored: 2, color: 'white', taste_description: 'Good with a birthday cake!!!')
      Bottle.create(name: 'Château DuCon',  vintage: 1989, purchased: 4, stored: 3, color: 'white') # with accent
    end

    it 'returns correct results' do
      post '/bottles/search'
      expect(response).to be_successful
      expect(json_body['search']['total']).to be_present
      expect(json_body['search']['remaining_count']).to be_present
      expect(json_body['search']['bottles_count']).to be_present
      expect(json_body['search']['bottles']).to be_present
    end
  end

  describe '#create' do
    it 'do nothing if wrong params' do
      post '/bottles'
      expect(response.status).to eq(422)
    end

    it 'works if minimum params are here' do
      post '/bottles', params: { name: 'Chateau du test', vintage: 1998 }
      expect(response.status).to eq(201)
    end
  end
end
