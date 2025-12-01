ActiveAdmin.register Order do
  permit_params :status

  index do
    selectable_column
    id_column
    column :order_number
    column :user do |order|
      order.user.email
    end
    column :total_amount do |order|
      number_to_currency order.total_amount
    end
    column :status
    column :created_at
    actions
  end

  filter :order_number
  filter :user
  filter :status, as: :select, collection: [ "pending", "paid", "shipped", "delivered", "cancelled" ]
  filter :created_at

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: [ "pending", "paid", "shipped", "delivered", "cancelled" ]
    end
    f.actions
  end

  show do
    attributes_table do
      row :order_number
      row :user
      row :province
      row :subtotal do |order|
        number_to_currency order.subtotal
      end
      row :gst_amount do |order|
        number_to_currency order.gst_amount
      end
      row :pst_amount do |order|
        number_to_currency order.pst_amount
      end
      row :hst_amount do |order|
        number_to_currency order.hst_amount
      end
      row :total_amount do |order|
        number_to_currency order.total_amount
      end
      row :status
      row :created_at
      row :updated_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price_at_purchase do |item|
          number_to_currency item.price_at_purchase
        end
        column :line_total do |item|
          number_to_currency item.line_total
        end
      end
    end

    panel "Customer Address" do
      para "#{order.user.first_name} #{order.user.last_name}"
      para order.user.street_address
      para "#{order.user.city}, #{order.province.name}"
      para order.user.postal_code
      para "Phone: #{order.user.phone}"
    end
  end
end
