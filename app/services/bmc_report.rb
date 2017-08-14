class BmcReport
  attr_reader :assets

  def initialize(args = {})
    @fund = args[:fund]
    @assets = args[:assets]
  end

  def changed?
    last_report_assets != new_report_assets
  end

  private

  def last_report_assets
    last_report = Report.last_for(@fund)
    if last_report
      last_report.assets.map do |asset|
        {
          crypto: asset.crypto.downcase,
          distribution: asset.distribution
        }
      end.sort_by { |asset| asset[:crypto].downcase }
    else
      []
    end
  end

  def new_report_assets
    @assets.map do |asset|
      {
        crypto: asset[:crypto].downcase,
        distribution: asset[:distribution].to_f.round(2)
      }
    end.sort_by { |asset| asset[:crypto].downcase }
  end
end
