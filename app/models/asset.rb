class Asset < ApplicationRecord
  belongs_to :report
  belongs_to :coin

  before_validation :set_start_price

  validates :start_price, presence: true
  validates :report, presence: true
  validates :coin, presence: true
  validates :distribution, presence: true

  def close!
    set_exit_price
  end

  def delta
    if exit_price.present?
      100 * (exit_price - start_price) / start_price
    end
  end

  def exit_price_for(invest)
    quantity = (invest * distribution / 100) / start_price
    quantity * exit_price
  end

  private

  def set_start_price
    self.start_price = current_price if start_price.blank?
  end

  def set_exit_price
    self.exit_price = current_price
    save
  end

  def current_price
    result = Cryptocompare::Price.find(coin.name, 'USD')
    result[coin.name]['USD']
  end
end
