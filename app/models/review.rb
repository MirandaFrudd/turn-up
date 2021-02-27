class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  belongs_to :restaurant
  belongs_to :activity
end
