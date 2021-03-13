class RemovePhotoFromBars < ActiveRecord::Migration[6.0]
  def change
    remove_column :bars, :photo, :string
  end
end
