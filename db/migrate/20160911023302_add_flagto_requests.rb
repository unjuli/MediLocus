class AddFlagtoRequests < ActiveRecord::Migration
  def change
    add_column :requests, :solved, :boolean, :default => 0, after: :prescription_id
    add_column :requests, :solved_by, :integer, after: :solved
  end
end
