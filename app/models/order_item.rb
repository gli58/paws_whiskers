class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :price_at_purchase, presence: true, numericality: { greater_than: 0 }

  before_save :calculate_line_total

  private

  def calculate_line_total
    self.line_total = quantity * price_at_purchase
  end
end
