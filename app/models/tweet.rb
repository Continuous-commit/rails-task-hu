# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  text       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  include Liked

  validates :text, length: { maximum: 140 }, presence: true

  #検索機能
  def self.looks(word)
    @tweet = Tweet.where("text LIKE?", "%#{word}%")
  end
end
