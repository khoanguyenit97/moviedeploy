class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 3, maximum: 20, allow_blank: true},
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3, maximum: 20, allow_blank: true }

  has_many :user_movies
  has_many :movies, through: :user_movies
end
