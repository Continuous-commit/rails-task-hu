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
FactoryBot.define do
  factory :profile do
    user { nil }
    name { "MyString" }
    profile_text { "MyText" }
  end
end
