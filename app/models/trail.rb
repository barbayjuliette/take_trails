class Trail < ApplicationRecord
  has_many :trips

  has_many :reviews, through: :trips

  has_many_attached :photos
  has_many :bookmarks, dependent: :destroy


  validates :name, presence: true, uniqueness: true
  validates :difficulty, presence: true, inclusion: { in: %w(Easy Intermediate Difficult)}
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

  def rating
    total_rating = 0
    self.reviews.each do |review|
      total_rating += review.rating
    end
    total_rating / self.reviews.count
  end
end
