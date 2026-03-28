ActiveAdmin.register Order do
  permit_params :status

  filter :status
  filter :created_at

  index do
    column :id
    column :user
    column :status
    column :grand_total
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :status
      row :subtotal
      row :gst_amount
      row :pst_amount
      row :hst_amount
      row :grand_total
      row :stripe_payment_id
      row :shipping_address
      row :created_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product_name
        column :unit_price
        column :quantity
        column :line_total
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ["new", "paid", "shipped"]
    end
    f.actions
  end
end