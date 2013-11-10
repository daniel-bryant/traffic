class AddTrafficWeatherToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :traffic, :boolean, default: true
    add_column :maps, :weather, :boolean, default: false
  end
end
