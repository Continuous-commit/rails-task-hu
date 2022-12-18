# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  provider               :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  uid                    :string(255)
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # 正常系
  describe 'positive for signup' do
    # ユーザ名・メールアドレス・パスワードが存在すれば有効であること
    it 'is valid with a name, an email and password' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end

  # 異常系
  describe 'type invalid' do
    # メールアドレスがなければ無効な状態であること
    it 'is invalid without an email address' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    # 重複したメールアドレスなら無効な状態であること
    it 'is invalid with a duplicate email address' do
      FactoryBot.create(:user)
      user = FactoryBot.build(:user)
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end
  end
end
