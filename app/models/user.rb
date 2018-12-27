class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_one :profile
end
