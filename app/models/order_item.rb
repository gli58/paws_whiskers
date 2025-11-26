class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :price_at_purchase, presence: true, numericality: { greater_than: 0 }

  before_save :calculate_line_total

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "line_total", "order_id", "price_at_purchase", "product_id", "quantity", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "order", "product" ]
  end

  private

  def calculate_line_total
    self.line_total = quantity * price_at_purchase
  end
end
