module LikesFunction

  def like(likable_type)
    likable_type.liked_by(current_user)
    redirect_to request.referer
  end

  def unlike(likable_type)
    likable_type.unliked_by(current_user)
    redirect_to request.referer
  end
end
