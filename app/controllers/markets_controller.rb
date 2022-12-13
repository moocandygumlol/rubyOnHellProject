class MarketsController < ApplicationController
  before_action :set_market, only: %i[ show edit update destroy ]

  # GET /markets or /markets.json
  def index
    @markets = Market.all
  end

  # GET /markets/1 or /markets/1.json
  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets or /markets.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to market_url(@market), notice: "Market was successfully created." }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1 or /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to market_url(@market), notice: "Market was successfully updated." }
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1 or /markets/1.json
  def destroy
    @market.destroy
    if session[:back] == "my_inventory"
      session[:back] = "nothing"
      redirect_to my_inventory_path, notice: "Inventory was successfully destroyed."
      
    else
      respond_to do |format|
        format.html { redirect_to markets_url, notice: "Market was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def updateInventory
    u = Market.where(id: params[:market_id]).first
    u.quantity = params[:quantity]
    u.price = params[:price]
    u.save
    redirect_to my_inventory_path, notice: "Your change already saved."
  end

  def is_numberic?(str)
    str == "#{str.to_f}" || str == "#{str.to_i}"
  end

  def addMarket
    if(is_numberic?(params[:price]) == false or is_numberic?(params[:quantity]) == false)
      redirect_to my_inventory_path, notice: "Your price and quantity need to be a real number."
    else
      m = Market.new
      m.user_id = params[:user_id]
      m.item_id = params[:item_id]
      m.quantity = params[:quantity]
      m.price = params[:price]
      m.save
      redirect_to my_inventory_path, notice: "Your new inventory already add."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def market_params
      params.require(:market).permit(:user_id, :item_id, :price, :quantity)
    end

end
