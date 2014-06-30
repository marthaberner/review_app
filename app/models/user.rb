class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true,
            uniqueness: true,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i, message: " is invalid"}

  validates :password, length: {minimum: 8}, allow_nil: true
end

