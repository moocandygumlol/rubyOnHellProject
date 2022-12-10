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
      redirect_to my_inventory_path, notice: "Inventory already deleted"
      session[:back] = "nothing"
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

  # def deleteMarket
  #   u = Market.where(id: params[:market_id]).first
  #   item_name = Item.where(id: u.item_id).first.name
  #   Market.delete(id: params[:market_id])
  #   redirect_to my_inventory_path, notice: item_name + "already deleted"
  # end

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
