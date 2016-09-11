class AddHdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :hd_status, :boolean, :default => 0
  end
end
