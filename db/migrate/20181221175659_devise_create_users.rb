# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", limit: 191
      t.string :encrypted_password, null: false, default: "", limit: 191

      ## Recoverable
      t.string   :reset_password_token, limit: 191
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Confirmable
      t.string   :confirmation_token, limit: 191
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true

    create_table :jwt_blacklist do |t|
      t.string    :jti, null: false, limit: 191
      t.datetime  :exp, null: false
    end
    add_index :jwt_blacklist, :jti
  end
end
