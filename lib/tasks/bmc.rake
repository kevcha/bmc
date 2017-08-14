require 'bmc_scrapper'

namespace :bmc do
  desc 'Scrap BMC founds'
  task scrap: :environment do
    puts "Scrapping extrem fund"
    BmcScrapper.new(fund: 'extrem').run
    puts "Scrapping dynamic fund"
    BmcScrapper.new(fund: 'dynamic').run
    puts "Scrapping retirement fund"
    BmcScrapper.new(fund: 'retirement').run
  end
end
