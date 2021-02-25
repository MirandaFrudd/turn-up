class Favourite < ApplicationRecord
  belongs_to :restaurant
  belongs_to :bar
  belongs_to :activity
  belongs_to :user
end
