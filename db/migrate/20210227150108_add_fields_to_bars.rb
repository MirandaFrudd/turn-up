class AddFieldsToBars < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :town, :string
    add_column :bars, :post_code, :string
    add_column :bars, :website, :string
    add_column :bars, :photo, :string
  end
end
