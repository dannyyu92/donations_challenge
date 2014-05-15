class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @items = Item.where(user_id: current_user.id)
  end

  def new
    @item = Item.new
    @item.build_donation(donatable_id: params[:id], donatable_type: "Item")
  end

  def create
    @item = Item.new(item_params)
    set_user_id
    if @item.save
      redirect_to root_path, notice: "Successfully created"
    else
      render :new
    end
  end

  private

  def set_user_id
    @item.user_id = current_user.id
  end

  def item_params
    params.require(:item).permit(:height, :width, :weight, donation_attributes: [:title, :description])
  end
end
