class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_one :review, dependent: :destroy
  has_many_attached :photos

  validates :date, presence: true
  validate :date_must_be_in_the_future, on: :create

  def date_must_be_in_the_future
    return if date > Time.now

    errors.add(:date, "must be in the future!")
  end
end
