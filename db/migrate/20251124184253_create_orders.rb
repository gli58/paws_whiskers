class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_number, null: false
      t.string :status, default: 'pending', null: false
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :gst_amount, precision: 10, scale: 2, default: 0
      t.decimal :pst_amount, precision: 10, scale: 2, default: 0
      t.decimal :hst_amount, precision: 10, scale: 2, default: 0
      t.decimal :total_amount, precision: 10, scale: 2, null: false
      t.integer :province_id

      t.timestamps
    end

    add_index :orders, :order_number, unique: true
    add_index :orders, :status
    add_foreign_key :orders, :provinces
  end
end
