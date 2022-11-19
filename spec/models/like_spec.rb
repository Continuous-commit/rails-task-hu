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
#  index_likes_on_user_and_likable             ("user", "likable") UNIQUE
#  index_likes_on_user_id                      (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
