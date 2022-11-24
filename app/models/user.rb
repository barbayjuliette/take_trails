class User < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :reviews, through: :trips
  # has_many :reviews, through: :trips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
end
