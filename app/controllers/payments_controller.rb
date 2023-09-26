class PaymentsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @payment = Payment.new
  end

  def new
  end
  
  def create
    @payment = Payment.new(payment_params)
    if @payment.valid?
      @payment.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
  private
  
  def payment_params
    params.require(:payment).permit(:price)
  end
  
end
