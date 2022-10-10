class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @tweets = Tweet.all.order(created_at: "DESC")
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweet.build(tweet_params)
    if @profile.save
      redirect_to root_path, notice: "ツイートを作成しました"
    else
      render new_tweet_path, notice: "ツイートの投稿に失敗しました"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
