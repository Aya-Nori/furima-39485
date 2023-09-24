class ShipmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    else
    end
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @shipment = Shipment.new(shipment_params)
    if @shipment.save
      redirect_to root_path
    else
    end
  end

  private

  def shipment_params
    params.require(:shipment).permit(:postcode, :region_id, :city, :area_number, :building, :tell)
  end

end
