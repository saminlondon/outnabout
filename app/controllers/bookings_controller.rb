class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    if current_user.nil?
      redirecrt_to new_user_session_path
    else
      @activity = Activity.where(id: current_user.slots.pluck(:activity_id).uniq)
      @booking = Booking.new
    end
  end

  def show
  end

  def my_bookings
    if current_user.nil?
      redirecrt_to new_user_session_path
    else
      @bookings = Booking.where(user_id: current_user.id)
    end
  end

  def create
    @activity = Activity.where(id: current_user.slots.pluck(:activity_id).uniq)
    @booking.activity = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirecrt_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
    redirecrt_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_party_size)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
