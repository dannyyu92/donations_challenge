class DonationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @items = Item.where(user_id: current_user.id).includes(:donation)
    @vouchers = Voucher.where(user_id: current_user.id).includes(:donation)
    @experiences = Experience.where(user_id: current_user.id).includes(:donation)
    gon.locations = @experiences
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    set_user_id
    if @donation.save
      redirect_to root_path, notice: "Successfully created"
    else
      render :new
    end
  end

  private

  def set_user_id
    @donation.user_id = current_user.id
  end

  def donation_params
    params.require(:donation).permit(:title, :description)
  end
end
