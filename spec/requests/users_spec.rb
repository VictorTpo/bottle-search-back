require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'POST /users', type: :request do
  let(:url) { '/users' }
  let(:params) do
    {
      email: 'totor@fake.fr',
      password: 'ToToR',
      full_name: 'ToTor'
    }
  end

  context 'when params are not correct' do
    it 'returns 422' do
      expect do
        post url, params: { email: 'only@email.fr' }, connected: false
        expect(response).to have_http_status(422)
      end.to_not change(User, :count)
    end
  end

  context 'when params are correct' do
    it 'returns 200' do
      expect do
        post url, params: params, connected: false
        expect(response).to have_http_status(200)
      end.to change(User, :count).by(1)
    end
  end
end
