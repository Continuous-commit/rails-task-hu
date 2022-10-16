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
FactoryBot.define do
  factory :comment do
    user { nil }
    tweet { nil }
    text { "MyString" }
  end
end
