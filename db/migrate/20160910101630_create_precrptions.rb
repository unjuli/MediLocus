class CreatePrecrptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.references :user, index: true
      t.references :request, index: true
      t.timestamps
    end
  end
end
