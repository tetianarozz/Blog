class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, polymorphic: true

  validates_presence_of :value, :user, :post
  validates :user_id, uniqueness: { scope: [:post_id] }
  validates :value, inclusion: 0..4
end
