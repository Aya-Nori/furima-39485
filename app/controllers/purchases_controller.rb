class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_top

  def index
    @item = Item.find(params[:item_id])
    if @item.purchase
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @item = Item.find(params[:item_id])
      @purchase_shipment = PurchaseShipment.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      pay_item
      @purchase_shipment.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipment).permit(:postcode, :region_id, :city, :area_number, :building, :tell, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_top
    @item = Item.find(params[:item_id])
    if @item.purchase
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
