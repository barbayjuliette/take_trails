class Trail < ApplicationRecord
  has_many :trips
  has_many_attached :photos
  has_many :bookmarks, dependent: :destroy

  DISTANCE_MAP =
    { '≤ 2 km' => { min: 0, max: 2 },
      '2 km to 5 km' => { min: 2, max: 5 },
      '> 5km' => {min: 5.1, max: 100 }
    }

  DURATION_MAP =
  { '≤ 45 min' => { min: 0, max: 45 },
    '45 mins to 90 mins' => { min: 45, max: 90 },
    '> 90 mins' => {min: 91, max: 500 }
  }

  enum :difficulty, { Easy: 'Easy', Intermediate: 'Intermediate', Difficult: 'Difficult' }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :distance, presence: true, numericality: true
  # inclusion: { in: DISTANCE_MAP }
  validates :duration, presence: true, numericality: true
  validates :location, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_description_location,
    against: [ :name, :description, :location ],
    using: {
      tsearch: { prefix: true }
    }

  def rating
    total_rating = 0
    self.reviews.each do |review|
      total_rating += review.rating
    end
    total_rating.fdiv(self.reviews.count)
  end
end
