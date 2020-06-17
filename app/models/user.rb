class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, allow_blank: false
  validates :password,
            format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}\Z/, message: "Password must be at least 8 characters long, contain at least 1 uppercase and 1 lowercase letter and 1 number" },
            confirmation: true
end
