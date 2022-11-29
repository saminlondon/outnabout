class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end
  def new
    @activity = Activity.new
    # @venue = Venue.where(current_user.id == :user_id)
  end
  def show
    @activity = Activity.find(params[:id])
  end
  def create
    @activity = Activity.new(activity_params)
    @venues = Venue.where(:id == current_user.id)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @activity = Activity.find(params[:id])
  end
  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy!
    redirect_to activities_path, notice: "Activity was successfully destroyed."

  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :operational_start_time, :operational_end_time, :activity_party_size,
    :price, :category)
  end
end
