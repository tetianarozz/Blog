# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  post_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  like_count    :integer          default(0)
#  dislike_count :integer          default(0)
#
class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, uniqueness: { scope: [:post_id] } #user_id унікальний в рамках post_id
end
