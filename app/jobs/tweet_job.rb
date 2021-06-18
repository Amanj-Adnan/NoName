class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    return if publish_at> Current.time
    tweet.publish_to_twitter!
  end
end
