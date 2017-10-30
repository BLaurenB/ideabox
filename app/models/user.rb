class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :ideas

  enum role: ["default", "admin"]
end
