class VenuesController < ApplicationController
  def index
    # @venues = Venue.all
    @venues = Venue.where(user: current_user)
    # @venues.map { |venue| venue if venue.user_id == current_user.id }
  end

  def new
    @venue = Venue.new
    # @venue = Venue.where(current_user.id == :user_id)
  end
  def show
    @venue = Venue.find(params[:id])
  end
  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @venue = Venue.find(params[:id])
  end
  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy!
    redirect_to activities_path, notice: "Venue was successfully destroyed."

  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description)
  end
end
