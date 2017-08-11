class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.string :crypto, null: false
      t.monetize :start_price, null: false
      t.monetize :exit_price
      t.float :distribution, null: false
      t.belongs_to :report, foreign_key: true, null: false

      t.timestamps
    end
  end
end
