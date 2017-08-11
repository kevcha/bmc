class Report < ApplicationRecord
  has_many :assets, dependent: :destroy
end
