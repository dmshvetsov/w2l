class Tag < ActiveRecord::Base
  has_many :likes
  has_many :user, through: :like
end
