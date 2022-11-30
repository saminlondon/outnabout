class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]


  def index
    if params[:search].present? && !params[:search][:query].empty?
      @activities = PgSearch.multisearch(params[:search][:query])
    elsif params[:search]
      @activities = Activity.all
    else
      @activities = Activity.all
    end
  end

  def new
    @venue = Venue.find(params[:venue_id])
    if current_user.nil?
      redirect_to new_user_session_path
      flash[:notice] = "Please Log In"
    else

      @activity = Activity.new
    end
  end

  def show
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.venue = Venue.find(params[:activity][:venue])
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
