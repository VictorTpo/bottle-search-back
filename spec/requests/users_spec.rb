require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'usersController', type: :request do
  let(:url) { '/users' }

  context 'when params are not correct' do
    it 'returns 422' do
      post url, params: { email: 'only@email.fr' }, connected: false
      expect(response).to have_http_status(422)
      expect(User.count).to eq(0)
    end
  end

  context 'when params are correct' do
    it 'returns 200 and create an account' do
      params = { email: 'totor@fake.fr', password: 'ToToR', full_name: 'Victor Tpo' }
      post url, params: params, connected: false
      expect(response).to have_http_status(200)
      expect(User.count).to eq(1)
    end
  end
end
