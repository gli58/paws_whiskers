ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name,
                :street_address, :city, :province_id, :postal_code, :phone

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :city
    column :province
    column :phone
    column "Orders" do |user|
      user.orders.count
    end
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :city
  filter :province
  filter :created_at

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :phone
    end

    f.inputs 'Address' do
      f.input :street_address
      f.input :city
      f.input :province, as: :select, collection: Province.all.map { |p| [ p.name, p.id ] }
      f.input :postal_code
    end

    f.inputs 'Password' do
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :first_name
      row :last_name
      row :phone
      row :street_address
      row :city
      row :province
      row :postal_code
      row :created_at
      row :updated_at
    end

    panel "Order History" do
      if user.orders.any?
        table_for user.orders.order(created_at: :desc) do
          column "Order Number" do |order|
            link_to order.order_number, admin_order_path(order)
          end
          column :status do |order|
            status_tag order.status
          end
          column "Total" do |order|
            number_to_currency order.total_amount
          end
          column :created_at
        end
      else
        para "No orders yet"
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "city", "created_at", "email", "first_name", "id", "last_name", "phone", "postal_code", "province_id", "street_address", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "orders", "province" ]
  end
end
