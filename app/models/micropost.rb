class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  
  validates :content, presence: true, length: { maximum: 255 }
end
