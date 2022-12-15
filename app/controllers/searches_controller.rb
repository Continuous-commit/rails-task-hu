# frozen_string_literal: true

class SearchesController < ApplicationController
  def search
    @range = params[:range]

    case @range
    when 'ツイート'
      @tweets = Tweet.looks(params[:word])
    when 'コメント'
      @comments = Comment.looks(params[:word])
    else
      @tweets = Tweet.looks(params[:word])
      @comments = Comment.looks(params[:word])
    end
  end
end
