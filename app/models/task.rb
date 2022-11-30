class Task < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates_presence_of :description, :message => 'Please enter an item'
end
