class ExperiencesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @experiences = Experience.where(user_id: current_user.id)
  end

  def new
    @experience = Experience.new
    @experience.build_donation(donatable_id: params[:id], donatable_type: "Experience")
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

  private

  def set_user_id
    @experience.user_id = current_user.id
  end

  def experience_params
    params.require(:experience).permit(:primary_contact_name, :latitude, :longitude, donation_attributes: [:title, :description])
  end
end
