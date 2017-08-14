class Report < ApplicationRecord
  has_many :assets, dependent: :destroy

  def self.last_for(fund)
    where(fund: fund).order(created_at: :desc).limit(1).first
  end

  def close!
    assets.each(&:close!)
    update_attribute(state: 'closed')
  end
end
