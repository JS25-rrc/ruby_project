class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province

  has_many :order_items

  validates :status, presence: true
  validates :grand_total, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "status", "grand_total", "created_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "status", "grand_total", "created_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end