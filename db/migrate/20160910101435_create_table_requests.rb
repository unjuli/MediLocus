class CreateTableRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true
      t.integer :medicine_type
      t.references :prescription, index: true
      t.timestamps
    end
  end
end
