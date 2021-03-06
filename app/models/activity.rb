class Activity < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  geocoded_by :post_code
  after_validation :geocode, if: :will_save_change_to_address?
end
