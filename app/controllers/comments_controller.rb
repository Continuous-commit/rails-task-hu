class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to tweet_path, notice: "コメントを投稿しました。"
    else
      redirect_to new_tweet_comment_path(params[:tweet_id]), alert: "コメントの投稿に失敗しました。"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:tweet_id, :text)
  end
end


