class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :trail

  validates :user, presence: true
  validates :trail, presence: true, uniqueness: { scope: :trail }

end
