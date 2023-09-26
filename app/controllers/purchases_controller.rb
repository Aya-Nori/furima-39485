class PurchasesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @purchase = Purchase.create
  end

end