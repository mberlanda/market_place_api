class ProductSerializer < ActiveModel::Serializer
  cache key: 'product', expires_in: 3.hours


  attributes :id, :title, :price, :published
  has_one :user

end
