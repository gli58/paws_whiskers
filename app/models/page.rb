class Page < ApplicationRecord
  validates :title, :slug, presence: true
  validates :slug, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "content", "created_at", "id", "slug", "title", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
