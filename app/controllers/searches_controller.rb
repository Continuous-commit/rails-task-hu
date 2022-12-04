class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "ツイート"
      @tweets = Tweet.looks(params[:word])
    elsif @range == "コメント"
      @comments = Comment.looks(params[:word])
    else
      @tweets = Tweet.looks(params[:word])
      @comments = Comment.looks(params[:word])
    end
  end
end
