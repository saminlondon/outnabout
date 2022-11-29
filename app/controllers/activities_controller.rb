class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end
  def new
    @activity = Activity.new
  end
  def show
    @activity = Activity.find(params[:id])
  end
  def create
    @activity = Activity.new(activity_params)
    @activity.save
  end
  def edit
    @activity = Activity.find(params[:id])
  end
  def update
    @activity = Activity.find(params[:id])
    @activity.upadate(activity_params)
  end
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy!
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :operational_start_time, :operational_end_time, :activity_party_size,
    :price, :category)
  end
end
