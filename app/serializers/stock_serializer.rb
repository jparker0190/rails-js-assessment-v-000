class StockSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :price
  has_many :assignments
  has_many :portfolios, through: :assignments
end
