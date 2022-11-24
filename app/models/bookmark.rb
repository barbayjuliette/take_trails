class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :trail

  # validates_presence_of :trail
  # validates_uniqueness_of :trail_id
end
