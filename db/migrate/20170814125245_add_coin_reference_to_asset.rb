class AddCoinReferenceToAsset < ActiveRecord::Migration[5.0]
  def change
    add_reference :assets, :coin, null: false, foreign_key: true
  end
end
