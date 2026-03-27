class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, optional: true

  validates :product_name, presence: true
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :line_total, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "product_name", "unit_price", "quantity", "line_total"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end