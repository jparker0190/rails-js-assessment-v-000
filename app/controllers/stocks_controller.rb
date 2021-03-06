class StocksController < ApplicationController

 before_action :set_stock, only: [:show, :edit, :update, :destroy]

 # GET /stocks
 def index
   @stocks = Stock.all
    respond_to do |format|
        format.json { render json: @stocks }
        format.html { render :index }
    end
 end

 # GET /stocks/:id
 def show
  if @stock == ""
   @error = "Please enter a stock ticker symbol."
 elsif if @stock
         begin
           @stock = StockQuote::Stock.quote(@stock.ticker)
         rescue StandardError
           @error = "That stock symbol does not exist."
         end
       end

end

 end

 # GET /stocks/new
 def new
   @stock = Stock.new
 end

 # GET /stocks/:id/edit
 def edit
 end

 # POST /stocks
 def create
   @stock = Stock.create(stock_params)
   render json: @stock, status: 201
 end

 # PATCH/PUT /stocks/:id
 def update
  respond_to do |format|
    if @stock.update(stock_params)
      format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
      format.json { render :show, status: :ok, location: @stock }
    else
      format.html { render :edit }
      format.json { render json: @stock.errors, status: :unprocessable_entity }
    end
  end
end

 # DELETE /stocks/:id
 def destroy
   Stock.find_by(:id => params[:id]).destroy
   redirect_to stocks_path
 end

 private
   def set_stock
     @stock = Stock.find(params[:id])
   end

   def stock_params
     params.require(:stock).permit(:ticker)
   end
end
