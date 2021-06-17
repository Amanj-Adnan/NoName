class User < ApplicationRecord
  has_secure_password
  has_many :twitter_accounts
  has_many :twitts

  validates :email, presence:  true


end
