class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_tweet, only: [:show, :like_tweet, :unlike_tweet]

  def index
    @tweets = if user_signed_in?
                # 自分の投稿とフォローユーザの投稿を表示
                Tweet.where(user_id: [current_user.id, *current_user.following_ids]).order('created_at DESC')
              else
                Tweet.all.order('created_at DESC')
              end
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

  def like_tweet
    like(@tweet)
  end

  def unlike_tweet
    unlike(@tweet)
  end

  private

  def find_tweet
    @tweet = Tweet.find_by(id: params[:id])
    redirect_to root_path, notice: "ツイートが存在しません" if @tweet.blank?
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
