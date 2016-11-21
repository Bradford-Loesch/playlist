class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence:true, length: {minimum: 2}
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, length: {minimum: 8}
  has_secure_password

  has_many :songlists
  has_many :songs, through: :songlists
end
