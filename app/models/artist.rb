class Artist < ApplicationRecord
  has_many :lps, dependent: :destroy
end
