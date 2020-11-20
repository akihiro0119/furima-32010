class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index] 

  def index
    @items = Area.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :price, :explanation, :category_id, :status_id, :freight_id, :area_id, :shipdate_id,)
  end

end
