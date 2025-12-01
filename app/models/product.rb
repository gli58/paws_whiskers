class Product < ApplicationRecord
  # Image with multiple size variants for responsive display
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 150, 150 ]
    attachable.variant :medium, resize_to_limit: [ 300, 300 ]
    attachable.variant :large, resize_to_limit: [ 800, 800 ]
  end

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :order_items

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :current_price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :on_sale, -> { where(on_sale: true) }
  scope :new_arrivals, -> { where("created_at >= ?", 3.days.ago) }
  scope :recently_updated, -> { where("updated_at >= ? AND created_at < ?", 3.days.ago, 3.days.ago) }

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "current_price", "description", "id", "is_new", "name", "on_sale", "stock_quantity", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "categories", "order_items", "product_categories" ]
  end
end
