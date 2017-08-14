class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.string :url
      t.string :image_url
      t.string :name, null: false
      t.string :coin_name, null: false

      t.timestamps
    end
  end
end
