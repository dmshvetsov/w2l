class Locality < ActiveRecord::Base
  has_many :check_ins
  has_many :users, through: :check_ins
  has_many :hantagaces
  has_many :tags, through: :hantagaces
  attr_reader :tag_tokens
  
  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end
end
