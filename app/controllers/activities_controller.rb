class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:query].present? && !params[:query].empty?
    #   @activities = PgSearch.multisearch(params[:query])
    # elsif params[:query]
    #   @activities = Activity.all
    # else
    #   @activities = Activity.all
    # end

    # @activities_pg = PgSearch.multisearch(params[:query]).where(searchable_type: "Activity")
    # @activites = @activities_pg.map do |activity_pg|
    #   Activity.find(activity_pg.searchable_id)
    # end

    # @venues_pg = PgSearch.multisearch(params[:query]).where(searchable_type: "Venue")
    # @venues = @venues_pg.map! do |venue_pg|
    #   Venue.find(venue_pg.searchable_id)
    # end
    # case
    # when @activites.present?

    if params[:query].present?
      @activities = Activity.where("name ILIKE ?", "%#{params[:query]}%")
      if @activities.empty?
        @venues = Venue.where("name ILIKE ?", "%#{params[:query]}%")
      else
        @venues = []
        @activities.each do |activity|
          @venues << activity.venue
        end
      end
    end
  end

  def all_activities
    @activities = Activity.all
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
