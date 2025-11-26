ActiveAdmin.register Product do
  permit_params :name, :description, :current_price, :stock_quantity, :on_sale, :is_new, :image, category_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :current_price do |product|
      number_to_currency product.current_price
    end
    column :stock_quantity
    column :on_sale
    column :is_new
    column :created_at
    actions
  end

  filter :name
  filter :on_sale
  filter :is_new
  filter :categories
  filter :created_at

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description, as: :text, input_html: { rows: 5 }
      f.input :current_price, input_html: { min: 0.01, step: 0.01 }  # 添加 min 和 step
      f.input :stock_quantity, input_html: { min: 0 }  # 添加 min
      f.input :on_sale
      f.input :is_new
      f.input :categories, as: :check_boxes, collection: Category.all
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image, height: 100) : content_tag(:span, 'No image uploaded')
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :current_price do |product|
        number_to_currency product.current_price
      end
      row :stock_quantity
      row :on_sale
      row :is_new
      row :image do |product|
        if product.image.attached?
          image_tag product.image, height: 200
        else
          content_tag(:span, 'No image')
        end
      end
      row :categories do |product|
        product.categories.map(&:name).join(', ')
      end
      row :created_at
      row :updated_at
    end
  end
end
