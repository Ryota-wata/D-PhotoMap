class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end
end
