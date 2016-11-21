class Song < ActiveRecord::Base
  validates :artist, :title, presence: true, length: {minimum: 2}

  has_many :songlists
  has_many :users, through: :songlists
end
