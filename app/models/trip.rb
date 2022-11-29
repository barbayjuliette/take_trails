class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_one :review, dependent: :destroy
  has_many_attached :photos

  validates :date, presence: true
  validate :must_be_after

  def must_be_after
    return if date > Time.now

    errors.add(:date, "must be in the future!")
  end
end
