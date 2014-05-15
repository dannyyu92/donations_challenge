class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @items = Item.where(user_id: current_user.id)
  end

  def new
    @item = Item.new
    @item.build_donation(donatable_id: params[:id], donatable_type: "Item")
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
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

  def update
    @item = Item.find(params[:id])
    set_user_id
    if @item.update_attributes(item_params)
      redirect_to @item, notice: "Successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, notice: "Successfully deleted"
  end

  private

  def set_user_id
    @item.user_id = current_user.id
  end

  def item_params
    params.require(:item).permit(:height, :width, :weight, donation_attributes: [:title, :description])
  end
end
