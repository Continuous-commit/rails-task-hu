class HomeController < ApplicationController

  def index
    @tweets = Tweet.all.order('created_at DESC')
  end
end
