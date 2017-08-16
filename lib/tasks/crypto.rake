require 'rest_client'
require 'json'

namespace :crypto do
  desc 'Create crypto currencies'
  task create: :environment do
    response = RestClient.get('https://www.cryptocompare.com/api/data/coinlist/')
    response = JSON.parse(response)

    count = 0
    response['Data'].each do |_, crypto|
      coin = Coin.new(
        url: crypto['Url'],
        image_url: crypto['ImageUrl'],
        name: crypto['Name'],
        coin_name: crypto['CoinName']
      )

      count + 1 if coin.save
    end

    puts "#{count} coin(s) created"
  end
end
