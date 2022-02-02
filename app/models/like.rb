# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  like       :boolean          default(FALSE)
#  dislike    :boolean          default(FALSE)
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
