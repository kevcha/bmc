require 'nokogiri'
require 'open-uri'

class BmcScrapper
  def initialize(args = {})
    @fund = args[:fund]
    url = "http://bluemagic.info/funds/#{@fund}-fund/"
    @scrapper = Nokogiri::HTML(open(url))
  end

  def run
    @report = scrap

    if @report.changed?
      ActiveRecord::Base.transaction do
        close_last_report
        open_new_report
      end
    end
  end

  private

  def close_last_report
    last_report = Report.last_for(@fund)
    last_report.close! if last_report.present?
  end

  def open_new_report
    new_report = Report.create(fund: @fund)
    @report.assets.each do |asset|
      coin_name = asset[:crypto].scan(/(\w+)/)[1][0]
      Asset.create(
        crypto: asset[:crypto],
        report: new_report,
        coin: Coin.where('name ilike coin_name').first,
        distribution: asset[:distribution].to_f.round(2)
      )
    end
  end

  def scrap
    assets = @scrapper.search('.tablepress')[0].search('tbody tr').map do |tr|
      tds = tr.search('td')
      {
        crypto: tds[0].text,
        quantity: tds[1].text,
        btc: tds[2].text,
        usd: tds[3].text,
        distribution: tds[4].text
      }
    end

    BmcReport.new(
      fund: @fund,
      assets: assets
    )
  end
end