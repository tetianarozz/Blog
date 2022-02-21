# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  first_name        :string
#  second_name       :string
#  email             :string           not null
#  password_digest   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  admin             :boolean          default(FALSE)
#  activation_digest :string
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  email_confirmed   :boolean          default(FALSE)
#  confirm_token     :string
#
class User < ApplicationRecord
  before_create :confirmation_token

  has_secure_password

  has_many :posts
  has_many :comments
  has_many :likes

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s  # встроенная функциональность для генерации случайной строки
    end
  end
end
