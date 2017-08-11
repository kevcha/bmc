class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :fund, null: false
      t.string :state, default: 'opened', null: false

      t.timestamps
    end
  end
end
