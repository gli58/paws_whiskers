class Province < ApplicationRecord
  has_many :users
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :gst_rate, :pst_rate, :hst_rate, numericality: { greater_than_or_equal_to: 0 }

  def total_tax_rate
    gst_rate + pst_rate + hst_rate
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "abbreviation", "created_at", "gst_rate", "hst_rate", "id", "name", "pst_rate", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "orders", "users" ]
  end
end
