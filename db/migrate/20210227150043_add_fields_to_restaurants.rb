class AddFieldsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :town, :string
    add_column :restaurants, :post_code, :string
    add_column :restaurants, :website, :string
    add_column :restaurants, :photo, :string
  end
end
