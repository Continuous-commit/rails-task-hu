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
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes, as: :likable, dependent: :destroy

  include Liked

  validates :name, presence: true
  validates :profile_text, presence: true
end
