class User < ActiveRecord::Base
  has_many :likes
  has_many :tags, through: :likes
  has_many :dislikes
  has_many :tags, through: :dislikes
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.image = auth.info.image
      user.urls = auth.info.urls.Facebook
      user.email = auth.info.email
      user.save!
    end
  end
end
