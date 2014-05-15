class VouchersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @vouchers = Voucher.where(user_id: current_user.id)
  end

  def new
    @voucher = Voucher.new
    @voucher.build_donation(donatable_id: params[:id], donatable_type: "Voucher")
  end

  def show
    @voucher = Voucher.find(params[:id])
  end

  def edit
    @voucher = Voucher.find(params[:id])
  end

  def create
    @voucher = Voucher.new(voucher_params)
    set_user_id
    if @voucher.save
      redirect_to root_path, notice: "Successfully created"
    else
      render :new
    end
  end

  def update
    @voucher = Voucher.find(params[:id])
    set_user_id
    if @voucher.update_attributes(voucher_params)
      redirect_to @voucher, notice: "Successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @voucher = Voucher.find(params[:id])
    @voucher.destroy
    redirect_to root_path, notice: "Successfully deleted"
  end

  private

  def set_user_id
    @voucher.user_id = current_user.id
  end

  def voucher_params
    params.require(:voucher).permit(:expiration_date, donation_attributes: [:title, :description])
  end
end
