class Order < ApplicationRecord
  belongs_to :user

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true

  has_many :placements
  has_many :products, through: :placements

  before_validation :set_total!
  validates_with EnoughProductsValidator

  def set_total!
    self.total = placements.map{ |pl| pl.product.price * pl.quantity }.sum
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      id, quantity = product_id_and_quantity
      self.placements.build(product_id: id, quantity: quantity)
    end
  end
end
