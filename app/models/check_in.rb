class CheckIn < ActiveRecord::Base
  belongs_to :locality
  belongs_to :user
end
