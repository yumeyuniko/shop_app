class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_target_item, only: %i[show edit update destroy]

  def index
    @items = Item.page(params[:page]).order('created_at DESC')
  end

  def new
    @item = Item.new(flash[:item])
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:notice] = "「#{item.name}」の商品を登録しました」"
      redirect_to item
    else
      redirect_to new_item_path, flash: {
        item: item,
        error_messages: item.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(item_id: @item.id)
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to @item
  end

  def destroy
    @item.delete
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation).merge(user_id: current_user.id)
  end

  def set_target_item
    @item = Item.find(params[:id])
  end
end
