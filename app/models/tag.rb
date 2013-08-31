class Tag < ActiveRecord::Base
  has_many :likes
  has_many :user, through: :likes
  has_many :dislikes
  has_many :user, through: :dislikes
end
