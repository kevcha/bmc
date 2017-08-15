require 'bmc_scrapper'

namespace :bmc do
  desc 'Scrap BMC founds'
  task scrap: :environment do
    Rake::Task['crypto:create'].invoke

    old_number = Report.count
    puts "Scrapping extrem fund"
    BmcScrapper.new(fund: 'extrem').run
    puts "Scrapping dynamic fund"
    BmcScrapper.new(fund: 'dynamic').run
    puts "Scrapping retirement fund"
    BmcScrapper.new(fund: 'retirement').run
    new_number = Report.count

    puts "#{new_number - old_number} new report(s)"
  end
end
