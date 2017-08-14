require 'rest_client'
require 'json'

namespace :crypto do
  desc 'Create crypto currencies'
  task create: :environment do
    response = RestClient.get('https://www.cryptocompare.com/api/data/coinlist/')
    response = JSON.parse(response)

    response['Data'].each do |_, crypto|
      Coin.create(
        url: crypto['Url'],
        image_url: crypto['ImageUrl'],
        name: crypto['Name'],
        coin_name: crypto['CoinName']
      )
    end
  end
end
