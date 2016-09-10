class AddTempfilePathToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :file_name, :text, :default => nil, after: :request_id
  end
end
