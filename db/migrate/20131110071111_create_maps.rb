class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :lat
      t.string :lon
      t.string :zoom

      t.timestamps
    end
  end
end
