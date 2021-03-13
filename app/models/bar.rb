class Bar < ApplicationRecord
  has_many :favourites
  has_many :reviews
  has_one_attached :photo
end
