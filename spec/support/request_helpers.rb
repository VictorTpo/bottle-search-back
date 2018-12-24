module RequestHelpers
  def json_body
    @_json_body ||= Oj.load(response.body) || {}
  end

  %w(get post put patch delete).each do |method|
    define_method(method) do |path, params: nil, headers: nil, env: nil, xhr: false, as: nil, connected: true|
      if connected
        user = User.find_by(email: 'user@logged.com') || FactoryBot.create(:user, email: 'user@logged.com', password: 'lorem')
        headers = { 'Accept' => 'application/json' }
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      else
        auth_headers = headers
      end
      super(path, params: params,
                  headers: auth_headers,
                  env: env,
                  xhr: xhr,
                  as: as)
    end
  end
end
