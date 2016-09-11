class AddPictureToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :picture, :string
  end
end
