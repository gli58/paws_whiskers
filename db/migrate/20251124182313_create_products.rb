class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :current_price, precision: 10, scale: 2, null: false
      t.integer :stock_quantity, default: 0
      t.boolean :on_sale, default: false
      t.boolean :is_new, default: false

      t.timestamps
    end

    add_index :products, :name
    add_index :products, :on_sale
    add_index :products, :is_new
  end
end
