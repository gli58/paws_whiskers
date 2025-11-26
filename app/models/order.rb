class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :order_number, presence: true, uniqueness: true
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending paid shipped delivered cancelled] }

  before_validation :generate_order_number, on: :create

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "gst_amount", "hst_amount", "id", "order_number", "province_id", "pst_amount", "status", "subtotal", "total_amount", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "order_items", "products", "province", "user" ]
  end

  private

  def generate_order_number
    self.order_number = "PW#{Time.now.to_i}#{rand(1000..9999)}"
  end
end
