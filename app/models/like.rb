# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  likable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  likable_id   :integer
#  user_id      :integer          not null
#
# Indexes
#
#  index_likes_on_likable_type_and_likable_id  (likable_type,likable_id)
#  index_likes_on_user_id                      (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, polymorphic: true
end
