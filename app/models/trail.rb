class Trail < ApplicationRecord
  has_many :trips
  has_many_attached :photos
  has_many :bookmarks, dependent: :destroy

  DISTANCE_MAP =
    { '0-2': { min: 0, max: 2 },
      '2-5': { min: 2, max: 5 }
    }

  enum :difficulty, { Easy: 'Easy', Intermediate: 'Intermediate', Difficult: 'Difficult' }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :distance, presence: true, numericality: true, inclusion: { in: DISTANCE_MAP }
  validates :duration, presence: true, numericality: true
  validates :location, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_description_location,
    against: [ :name, :description, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }




  # acts_as_taggable_on :distances
  # acts_as_taggable_on :difficulties

  # enum :distance_groups: {

  # }

  # $duration = ["320.0", "268.0", "385.0"]
end

# Trail::DIFFICULTIES
