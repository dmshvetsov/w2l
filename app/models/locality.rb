class Locality < ActiveRecord::Base
  has_many :check_ins
  has_many :users, through: :check_ins
end
