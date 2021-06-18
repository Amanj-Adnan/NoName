class Twitt < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account


  validates :body, :length => {minimum: 1,maximum: 280}
  validates :publish_at, presence:true

  after_initialize do
    self .publish_at ||= 12.hours.from_now
  end

  after_save_commit do
    if publish_at_previously_changed?
      TweetJob.set(wait_until:publish_at).perform_later(self)
    end
  end

  def published?
    twitt_id?
  end
  def publish_to_twitter!
    tweet= twitter_account.client.update(body)
    update(twitt_id: tweet.id)
  end
end
