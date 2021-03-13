class RemovePhotoFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :photo, :string
  end
end
