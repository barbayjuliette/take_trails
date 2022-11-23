class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :trail

  # validates :date, presence: true
end
