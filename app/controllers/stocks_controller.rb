class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

# PATCH/PUT /stocks/1
# PATCH/PUT /stocks/1.json
  def update
    @stock.update(stock_params)
    redirect_to stock_path(@stock)
  end

# POST /stocks
# POST /stocks.json

  def create
    @stock = current_user.stocks.create(stock_params)
    redirect_to portfolios_path(@stock)
  end

# GET /stocks/new
  def new
    @stock = Stock.new
  end

# GET /stocks/1/edit
  def edit
  end

# GET /stocks/1
# GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
  end

# DELETE /stocks/1
# DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:symbol, :sector, :high, :low, :price)
    end
end
