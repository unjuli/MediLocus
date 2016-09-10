class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string      :name
      t.date        :dob
      t.string      :phone, :limit => 15
      t.string      :address
      t.string      :license
      t.integer     :country_id, :limit => 2
      t.integer     :state_id, :limit => 1
      t.integer     :status, :limit => 1, :default => 0
      t.string      :pincode, :limit => 8
      t.integer     :role, :limit => 1, :default => 0
      t.boolean     :mobile, :default => 0
      
      ## Devise
      ## Database authenticatable
      t.string :email,              :null => false
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :limit => 3, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :ip
      
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      t.timestamps
    end
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
  end
end