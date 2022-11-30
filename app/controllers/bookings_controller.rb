class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
    @slots = Slot.all
  end

  def new
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @activity = Activity.find(params[:activity_id])
      @slots = @activity.slots
      @booking = Booking.new
    end
  end

  def show
  end

  def my_bookings
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @bookings = Booking.where(user_id: current_user.id)
      # @activity = Activity.where(id: current_user.slots.pluck(:activity_id).uniq)
    end
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:activity_id])
  end

  def update
    # @activity = Activity.find(params[:activity_id])
    @booking.update!(booking_params)
    redirect_to activity_booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to activity_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_party_size, :slot_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
