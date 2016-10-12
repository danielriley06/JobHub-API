class User < ApplicationRecord
  has_many :jobs

  has_secure_password

  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
