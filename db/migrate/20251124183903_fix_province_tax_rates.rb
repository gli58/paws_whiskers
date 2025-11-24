class FixProvinceTaxRates < ActiveRecord::Migration[7.1]
  def change
    change_column :provinces, :gst_rate, :decimal, precision: 5, scale: 2, default: 0
    change_column :provinces, :pst_rate, :decimal, precision: 5, scale: 2, default: 0
    change_column :provinces, :hst_rate, :decimal, precision: 5, scale: 2, default: 0
  end
end
