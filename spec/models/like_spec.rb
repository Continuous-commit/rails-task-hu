# frozen_string_literal: true

# == Schema Information
#
# Table name: likes
#
#  id           :bigint           not null, primary key
#  likable_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  likable_id   :bigint
#  user_id      :bigint           not null
#
# Indexes
#
#  index_likes_on_likable_type_and_likable_id              (likable_type,likable_id)
#  index_likes_on_user_id                                  (user_id)
#  index_likes_on_user_id_and_likable_id_and_likable_type  (user_id,likable_id,likable_type) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
