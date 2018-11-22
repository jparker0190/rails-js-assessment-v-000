class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :user
  has_many :assignments
  has_many :stocks, through: :assignments
end
