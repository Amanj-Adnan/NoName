class TwittsController < ApplicationController
  before_action :require_user_logged!
  before_action :set_tweet ,only: [:edit,:update ,:destroy]

  def index
    @tweets =Current.user.twitts
  end

  def new
    @tweet = Twitt.new
  end

  def show
    @tweets =Current.user.twitts
    render :index
  end

  def create
    @tweet = Current.user.twitts.new(tweet_params)
    if @tweet.save
      redirect_to @tweet
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @tweet.update(tweet_params)
      redirect_to twitts_path
    else
      render :edit
    end
  end
  def destroy
    @tweet.destroy
    redirect_to twitts_path
  end

  private

  def tweet_params
    params.require(:twitt).permit(:twitter_account_id,:body ,:publish_at)
  end

  def set_tweet
    @tweet = Current.user.twitts.find(params[:id])
  end
end
