class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "on_sale", "price", "sale_price", "stock_quantity", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end