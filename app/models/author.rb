class Author < ApplicationRecord
  has_many :song_authors, dependent: :destroy
  has_many :songs, through: :song_authors
end
