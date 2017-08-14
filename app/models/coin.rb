class Coin < ApplicationRecord
  validates :name, presence: true
  validates :coin_name, presence: true
end
