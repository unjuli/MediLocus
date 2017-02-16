class CreateBiddings < ActiveRecord::Migration
  def change
    create_table :biddings do |t|
      t.references :user, index: true
      t.references :request, index: true
      t.integer :amount
      t.datetime :delivery_time
      t.timestamps
    end
  end
end
