class RemoveNotNullOnReviews < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reviews, :bar_id, true
    change_column_null :reviews, :restaurant_id, true
    change_column_null :reviews, :activity_id, true
  end
end
