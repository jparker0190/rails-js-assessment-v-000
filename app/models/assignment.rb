class Assignment < ApplicationRecord
    validates :direction, presence: true
    validates :shares, presence: true
    belongs_to :stock
    belongs_to :portfolio
    def self.alphabatize
     @stocks = Stock.order('ticker ASC')
    end
end
