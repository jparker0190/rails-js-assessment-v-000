class StockSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :sector, :high, :low, :price
end
