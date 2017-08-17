class ReportsController < ApplicationController
  def index
    @retirements = Report.retirement
    @dynamics = Report.dynamic
    @extrems = Report.extrem
  end
end
