# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { FactoryBot.build(:tweet, text: 'test tweet') }

  # 正常系
  describe 'liked_by' do
    it 'ツイートをいいねできる' do
      user = FactoryBot.create(:user, email: 'user@example.com', password: 'password')
      tweet.save
      tweet.liked_by(user)
      expect(tweet.likes.find_by(user: user)).to_not eq nil
    end
  end

  # 異常系
  describe 'type invalid' do
    it 'ユーザーが紐づいていいない' do
      tweet = FactoryBot.build(:tweet, user: nil)
      tweet.valid?
      expect(tweet.errors[:user]).to include('を入力してください')
    end

    it '140文字以上のツイート' do
      tweet.text = 'a' * 141
      tweet.valid?
      expect(tweet.errors[:text]).to include('は140文字以内で入力してください')
    end
  end
end
