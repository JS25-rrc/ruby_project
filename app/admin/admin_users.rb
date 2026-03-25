ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :on_sale, :sale_price

  filter :name
  filter :price
  filter :on_sale
  filter :stock_quantity
end