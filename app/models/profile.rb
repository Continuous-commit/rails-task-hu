# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  profile_text :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes, as: :likable, dependent: :destroy

  include Liked

  validates :name, presence: true
  validates :profile_text, presence: true
end
