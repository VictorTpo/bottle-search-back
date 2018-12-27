class Profile < ApplicationRecord
  belongs_to :user

  validates :full_name, presence: true
  validates :user,      presence: true
end
