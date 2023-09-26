class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
  end


  private

  def purchase_params
    params.require(:purchase).permit(:useer_id, :item_id)
  end

end