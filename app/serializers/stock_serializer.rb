class StockSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :price
end
