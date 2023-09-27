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
    @purchase = Purchase.create(purchase_params)
    @payment = Payment.create(payment_params)
    @shipment = Shipment.new(shipment_params)
    @shipment.item = @item
    if @shipment.save
      redirect_to root_path
    end
  end

  private

  def purchase_params
    params.permit(:useer_id, :item_id)
  end

  def payment_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def shipment_params
    params.require(:shipment).permit(:purchase_id, :postcode, :region_id, :city, :area_number, :building, :tell).merge(payment_id: payment.id)
  end
  
end