namespace :assets do
  task fix: :environment do
    Asset.all.each do |asset|
      split = asset.crypto.scan(/(\w+)/)
      coin_name = split[0][0]
      name = split[1][0]
      coin = Coin.where('coin_name ilike ? OR name ilike ?', coin_name, name).first
      asset.coin = coin
      response = Cryptocompare::PriceHistorical.find(coin.name, 'USD', { ts: asset.created_at.to_i })
      asset.start_price = response[coin.name]['USD']
      asset.save!
    end

    Asset.where.not(exit_price: nil).each do |asset|
      response = Cryptocompare::Price.find(asset.coin.name, 'USD')
      asset.exit_price = response[asset.coin.name]['USD']
      asset.save!
    end
  end
end
