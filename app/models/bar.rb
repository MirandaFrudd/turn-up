class Bar < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
