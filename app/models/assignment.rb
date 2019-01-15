class Assignment < ApplicationRecord
    validates :direction, presence: true
    validates :shares, presence: true
    belongs_to :stock
    belongs_to :portfolio
    def self.alphabatize
        @stocks = Stock.order('ticker ASC')
    end
    def self.new_from_lookup(symbol)
      begin
          stock = StockQuote::Assignment.quote(symbol)
          new(company_name: stock.company_name)
      rescue Exception => e
          return nil
      end
    end

end
