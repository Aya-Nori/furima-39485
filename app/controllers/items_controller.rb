class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    return if current_user == @item.user

    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '修正されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id, :charge_id, :region_id,
                                 :estimate_id).merge(user_id: current_user.id)
  end
end
