class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all

    @markers = @venues.geocoded.map do |v|
      {
        lat: v.latitude,
        lng: v.longitude,
        info_window: render_to_string(partial: "info_window", locals: { v: v }),
        image_url: helpers.asset_url("pin.png")

      }
    end
  end

  def new
    @venue = Venue.new
    # @venue = Venue.where(current_user.id == :user_id)
  end

  def my_venues
    @venues = Venue.where(user: current_user)
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
    @activity = Activity.where(venue: @venue)
    @activity.each { |a| a.destroy }
    @venue.destroy!
    redirect_to my_venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
