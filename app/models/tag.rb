class Tag < ActiveRecord::Base
  has_many :likes
  has_many :user, through: :like
  has_many :dislikes
  has_many :user, through: :dislike
end
