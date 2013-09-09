class Tag < ActiveRecord::Base
  has_many :likes
  has_many :user, through: :likes
  has_many :dislikes
  has_many :user, through: :dislikes
  has_many :hantagaces
  has_many :localities, through: :hantagaces
end
