class ShipmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def new
    @shipment = Shipment.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @shipment = Shipment.new(shipment_params)
    @shipment.item = @item
    if @shipment.save
      redirect_to root_path
    end
  end

  private

  def shipment_params
    params.require(:shipment).permit(:postcode, :region_id, :city, :area_number, :building, :tell)
  end
end
