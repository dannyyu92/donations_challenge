class ExperiencesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @experiences = Experience.where(user_id: current_user.id)
  end

  def new
    @experience = Experience.new
    @experience.build_donation(donatable_id: params[:id], donatable_type: "Experience")
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def create
    @experience = Experience.new(experience_params)
    set_user_id
    if @experience.save
      redirect_to root_path, notice: "Successfully created"
    else
      render :new
    end
  end

  def update
    @experience = Experience.find(params[:id])
    set_user_id
    if @experience.update_attributes(experience_params)
      redirect_to @experience, notice: "Successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to root_path, notice: "Successfully deleted"
  end

  private

  def set_user_id
    @experience.user_id = current_user.id
  end

  def experience_params
    params.require(:experience).permit(:primary_contact_name, :latitude, :longitude, donation_attributes: [:title, :description])
  end
end
