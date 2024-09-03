class Song < ApplicationRecord
  belongs_to :lp
  has_many :song_authors, dependent: :destroy
  has_many :authors, through: :song_authors
end
