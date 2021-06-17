class Twitt < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account


  validates :body, :length => {minimum: 1,maximum: 280}
  validates :publish_at, presence:true

  after_initialize do
    self .publish_at ||= 12.hours.from_now
  end

  def published?
    twitt_id?
  end
end
