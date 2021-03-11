class Bar < ApplicationRecord
  has_many :favourites
  has_one_attached :photo
end
