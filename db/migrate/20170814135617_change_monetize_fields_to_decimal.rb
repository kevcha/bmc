class ChangeMonetizeFieldsToDecimal < ActiveRecord::Migration[5.0]
  def change
    remove_column :assets, :start_price_cents
    remove_column :assets, :start_price_currency
    remove_column :assets, :exit_price_cents
    remove_column :assets, :exit_price_currency

    add_column :assets, :start_price, :decimal, precision: 16, scale: 10
    add_column :assets, :exit_price, :decimal, precision: 16, scale: 10
  end
end
