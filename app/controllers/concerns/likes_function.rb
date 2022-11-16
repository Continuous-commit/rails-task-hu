module LikesFunction
  def like(likable_type)
    if likable_type.liked_by?(current_user)
      likable_type.unliked_by(current_user)
    else
      likable_type.liked_by(current_user)
    end
  end
end
