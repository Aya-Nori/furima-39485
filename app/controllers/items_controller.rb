class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    return if current_user == @item.user

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '修正されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      return unless @item.destroy

      redirect_to root_path, notice: '削除されました。'
    else
      redirect_to root_path
    end
  end

  def show
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

  def item_find
    @item = Item.find(params[:id])
  end
end
