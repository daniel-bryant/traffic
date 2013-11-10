class AddMapDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat,  :string
    add_column :users, :lon,  :string
    add_column :users, :zoom, :string
  end
end
