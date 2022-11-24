class Trail < ApplicationRecord
  DIFFICULTIES = %w(Easy Intermediate Difficult)
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :difficulty, presence: true, inclusion: { in: DIFFICULTIES }
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



  enum :difficulty_level, %i(easy intermediate difficult)

  # $difficulties = ["Easy", "Intermediate", "Difficult"]
  # $duration = ["320.0", "268.0", "385.0"]
end

# Trail::DIFFICULTIES
