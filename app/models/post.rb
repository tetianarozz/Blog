# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }

  def formatted_created_at
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end


end
