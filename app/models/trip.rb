class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_many :reviews, dependent: :destroy

  # validates :date, presence: true
end
