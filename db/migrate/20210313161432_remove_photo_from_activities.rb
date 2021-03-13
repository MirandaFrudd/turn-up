class RemovePhotoFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :photo, :string
  end
end
