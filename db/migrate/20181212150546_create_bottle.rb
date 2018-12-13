class CreateBottle < ActiveRecord::Migration[5.2]
  def change
    create_table :bottles do |t|
      t.string  :name,      null: false, limit: 191, index: true
      t.integer :vintage,   null: false
      t.integer :purchased, null: false
      t.integer :stored,    null: false
      t.string  :color,     limit: 191
      t.string  :family,    limit: 191
      t.boolean :sparkling, null: false, default: false
      t.text    :grapes
      t.date    :purchase_date
      t.string  :purchase_occasion,  limit: 191
      t.string  :offerer,            limit: 191
      t.text    :description
      t.text    :taste_description
      t.text    :recipes_sample
      t.timestamp
    end
  end
end
