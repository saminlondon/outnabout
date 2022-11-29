class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]


  def index
    @activities = Activity.all
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @activity = Activity.new
    # @venue = Venue.where(current_user.id == :user_id)
  end



  def show
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.venue = Venue.where(:venue_id == current_user.id)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity.destroy!
    redirect_to activities_path

  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :operational_start_time, :operational_end_time, :activity_party_size, :price, :category)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
