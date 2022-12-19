# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  name         :string(255)      not null
#  profile_text :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile, name: 'テストくん', profile_text: 'This is the test')
  end

  # 正常系
  describe 'type valid' do
    it '名前とプロフィール文とプロフィール画像があり、Userと紐づいている' do
      @profile.image = fixture_file_upload("/files/test.jpg")
      expect(@profile).to be_valid
    end
  
    it 'プロフィール画像がない場合はデフォルトの画像' do
      @profile.save
      expect(@profile.image).not_to eq nil 
    end
  end
end
