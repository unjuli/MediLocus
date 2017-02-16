class AddHdToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :hd_status, :boolean, :default => 0
  end
end
