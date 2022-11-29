class VenuesController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all(user: current_user)
  end

  def new
    @venue = Venue.new
    # @venue = Venue.where(current_user.id == :user_id)
  end

  def my_venues
    @venues = Venue.where(user_id: current_user.id)
  end

  def show
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue.destroy!
    redirect_to activities_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
