namespace :reports do
  task close_date: :environment do
    Report.where(state: 'closed').each do |report|
      report.closed_at = report.assets.first.updated_at
      report.save
    end
  end
end
