class Trail < ApplicationRecord
  has_many :trips
  has_many_attached :photos
  has_many :bookmarks, dependent: :destroy

  enum :difficulty, { easy: 'easy', intermediate: 'intermediate', difficult: 'difficult' }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :distance, presence: true, numericality: true
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
