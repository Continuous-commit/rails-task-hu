# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_tweet_id  (tweet_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  tweet_id  (tweet_id => tweets.id)
#  user_id   (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :likes, as: :likable, dependent: :destroy

  validates :text, length: { maximum: 140 }, presence: true
end
