class AddTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :noti_token, :string
  end
end
