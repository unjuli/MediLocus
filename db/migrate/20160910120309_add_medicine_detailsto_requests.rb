class AddMedicineDetailstoRequests < ActiveRecord::Migration
  def change
    add_column :requests, :medicine_detail, :text, :default => nil, after: :medicine_type
  end
end
