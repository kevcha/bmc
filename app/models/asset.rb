class Asset < ApplicationRecord
  belongs_to :report
  belongs_to :coin
end
