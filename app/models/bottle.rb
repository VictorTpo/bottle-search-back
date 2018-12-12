class Bottle < ActiveRecord::Base
  validates :name,    presence: true
  validates :vintage, presence: true
  validates :box_id,  presence: true
  validates :color, inclusion: { in: %w(red white pink), allow_blank: true }

  def self.next_box_id
    (Bottle.pluck(:box_id).max || 0) + 1
  end

  def save
    self.box_id = Bottle.next_box_id unless box_id.present?
    super
  end
end
