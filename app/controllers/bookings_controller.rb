class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
  end

  def show
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @booking.activity = Booking.new(booking_params)
  end

  def edit
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user_party_size)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
