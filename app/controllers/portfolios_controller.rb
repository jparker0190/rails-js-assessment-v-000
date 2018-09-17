class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /portfolios
  # GET /portfolios.json
    def index
        @portfolio = Portfolio.all
    end

  # GET /portfolios/1
  # GET /portfolios/1.json
    def show
      @portfolio = Portfolio.find(params[:id])
    end

  # GET /portfolios/new
    def new
      @portfolio = Portfolio.new
    end

  # GET /portfolios/1/edit
    def edit
      @portfolio.update(portfolio_params)
    end

  # POST /portfolios
  # POST /portfolios.json
    def create
      portfolio = Portfolio.create(portfolio_params)
      redirect_to portfolio
    end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
    def update
        respond_to do |format|
        if @portfolio.update(portfolio_params)
          format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
          format.json { render :show, status: :ok, location: @portfolio }
        else
          format.html { render :edit }
          format.json { render json: @portfolio.errors, status: :unprocessable_entity }
        end
      end
    end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
    def destroy
      @portfolio.destroy
    end

  private
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end
  # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:symbol, :sector, :high, :low, :price, :stock_id[], :user_id[])
    end
end
