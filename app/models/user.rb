class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province, optional: true
  has_many :orders, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "city", "created_at", "email", "first_name", "id", "last_name", "postal_code", "province_id", "street_address", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "orders", "province" ]
  end
end
