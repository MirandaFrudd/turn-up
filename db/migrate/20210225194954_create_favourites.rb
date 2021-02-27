class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :bar, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
