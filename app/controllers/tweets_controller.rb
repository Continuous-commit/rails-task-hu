class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_tweet, only: [:show]

  def index
    @tweets = Tweet.all.order(created_at: "DESC")
  end

  def show
    @user = @tweet.user
    @comments = @tweet.comments.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: "ツイートを作成しました"
    else
      flash.now[:alert] = 'ツイートの投稿に失敗しました'
      render new_tweet_path
    end
  end

  private

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
