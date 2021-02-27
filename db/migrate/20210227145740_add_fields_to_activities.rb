class AddFieldsToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :town, :string
    add_column :activities, :post_code, :string
    add_column :activities, :opening_time, :datetime
    add_column :activities, :closing_time, :datetime
    add_column :activities, :website, :string
    add_column :activities, :photo, :string
  end
end
