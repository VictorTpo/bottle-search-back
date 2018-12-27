class CreateProfile < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references  :user,      null: false
      t.string      :full_name, null: false
      t.date        :birthday
      t.timestamps null: false
    end
  end
end
