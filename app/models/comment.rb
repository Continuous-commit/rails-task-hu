# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_tweet_id  (tweet_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tweet_id => tweets.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :likes, as: :likable, dependent: :destroy

  include Liked

  validates :text, length: { maximum: 140 }, presence: true

  # 検索機能
  def self.looks(word)
    @comment = Comment.where('text LIKE?', "%#{word}%")
  end
end
