class AddClosedAtToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :closed_at, :datetime
  end
end
