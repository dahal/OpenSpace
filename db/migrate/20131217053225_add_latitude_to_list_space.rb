class AddLatitudeToListSpace < ActiveRecord::Migration
  def change
  add_column :list_spaces, :latitude, :float
  add_column :list_spaces, :longitude, :float

  end
end
