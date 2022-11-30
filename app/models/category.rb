class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :reviews, through: :tags
end
