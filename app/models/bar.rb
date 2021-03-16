class Bar < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
end
