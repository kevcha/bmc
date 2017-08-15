class Coin < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :coin_name, presence: true, uniqueness: true
end
