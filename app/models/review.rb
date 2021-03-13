class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :bar, optional: true
  belongs_to :restaurant,  optional: true
  belongs_to :activity,  optional: true
end
