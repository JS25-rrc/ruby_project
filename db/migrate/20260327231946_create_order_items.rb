class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :product_name
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :line_total
      t.decimal :gst_rate_snapshot
      t.decimal :pst_rate_snapshot
      t.decimal :hst_rate_snapshot

      t.timestamps
    end
  end
end
