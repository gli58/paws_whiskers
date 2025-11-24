class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :order_number, presence: true, uniqueness: true
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending paid shipped delivered cancelled] }

  before_validation :generate_order_number, on: :create

  private

  def generate_order_number
    self.order_number = "PW#{Time.now.to_i}#{rand(1000..9999)}"
  end
end
