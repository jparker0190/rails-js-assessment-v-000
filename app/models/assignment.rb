class Assignment < ApplicationRecord
    validates :direction, presence: true
    validates :shares, presence: true
    validates_uniqueness_of :stock_id, :case_sensitive => false
    belongs_to :stock
    belongs_to :portfolio
    def self.alphabatize
     @stocks = Stock.order('ticker ASC')
    end
end
