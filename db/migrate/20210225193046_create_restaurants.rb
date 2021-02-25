class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :budget
      t.integer :rating
      t.boolean :day
      t.boolean :night

      t.timestamps
    end
  end
end
