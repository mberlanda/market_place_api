class Product < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 },
                    presence: true
  belongs_to :user
  scope :filter_by_title, -> (k) { where("lower(title) LIKE ?", "%#{k.downcase}%" ) }
  scope :above_or_equal_to_price, -> (price) { where("price >= ?", price) }
  scope :below_or_equal_to_price, -> (price) { where("price <= ?", price) }
  scope :recent, -> ()  { order(:updated_at) }
end
