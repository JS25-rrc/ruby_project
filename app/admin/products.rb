ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :on_sale, :sale_price, :image, category_ids: []

  filter :name
  filter :price
  filter :on_sale
  filter :stock_quantity

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :on_sale
      f.input :sale_price
      f.input :image, as: :file
      f.input :categories, as: :check_boxes, collection: Category.all
    end
    f.actions
  end

  index do
    column :name
    column :price
    column :on_sale
    column :stock_quantity
    column :categories do |product|
      product.categories.map(&:name).join(", ")
    end
    actions
  end
end