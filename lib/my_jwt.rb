module MyJwt
  def self.decode_token(token)
    JWT.decode(token.gsub('Bearer ', ''), ENV['DEVISE_JWT_SECRET_KEY'])
  end
end
