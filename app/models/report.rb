class Report < ApplicationRecord
  has_many :assets, -> { order(distribution: :desc) }, dependent: :destroy

  def self.last_for(fund)
    where(fund: fund).order(created_at: :desc).limit(1).first
  end

  def self.retirement
    where(fund: 'retirement').ordered
  end

  def self.dynamic
    where(fund: 'dynamic').ordered
  end

  def self.extrem
    where(fund: 'extrem').ordered
  end

  def self.ordered
    order(created_at: :asc)
  end

  def close!
    assets.each(&:close!)
    update_attributes(
      state: 'closed',
      closed_at: Time.current
    )
  end

  def closed?
    state == 'closed'
  end

  def profit_for(invest)
    assets.reduce(0) do |sum, asset|
      sum += asset.exit_price_for(invest)
    end
  end

  def delta
    profit_for(100) - 100
  end
end
