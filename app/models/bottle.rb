class Bottle < ApplicationRecord
  validates :name,      presence: true
  validates :vintage,   presence: true
  validates :color, inclusion: { in: %w(red white pink), allow_blank: true }

  before_save :set_purchased_and_store

  scope :remaining, -> { where(arel_table[:stored].gt(0)) }

  def set_purchased_and_store
    self.purchased  = 1 if purchased.nil?
    self.stored     = purchased if stored.nil?
  end
end
