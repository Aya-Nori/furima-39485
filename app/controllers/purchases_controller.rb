class DonationsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @purchase_shipment = PurchaseShipment.new
  end

  def create
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      @purchase_shipment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipment).permit(:postcode, :region_id, :city, :area_number, :building, :tell, :price).merge(user_id: current_user.id)
  end

end
