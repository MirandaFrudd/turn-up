class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :bar, optional: true
  belongs_to :restaurant,  optional: true
  belongs_to :activity,  optional: true

  RATING = [1, 2, 3, 4, 5]

  def rating_as_percent
    (rating / 5.0) * 100.0
  end

end
