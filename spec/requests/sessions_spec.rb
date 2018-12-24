require 'rails_helper'
require 'devise/jwt/test_helpers'
require 'my_jwt'

RSpec.describe 'POST /login', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:url) { '/login' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    it 'returns 200' do
      post url, params: params, connected: false
      expect(response).to have_http_status(200)
      expect(response.headers['Authorization']).to be_present
      decoded_token = MyJwt.decode_token(response.headers['Authorization'])
      expect(decoded_token.first['sub']).to be_present
    end
  end

  context 'when params are not correct' do
    it 'returns 401' do
      post url, params: { user: { email: user.email, password: 'wrong' } }, connected: false
      expect(response).to have_http_status(401)
    end
  end
end

RSpec.describe 'DELETE /logout', type: :request do
  let(:url) { '/logout' }

  it 'returns 204, no content' do
    delete url
    expect(response).to have_http_status(204)
  end
end
