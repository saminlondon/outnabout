class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :checkout]

  def index
    @bookings = Booking.all
    @slots = Slot.all
  end

  def new
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @activity = Activity.find(params[:activity_id])
      @slots_available = Slot.available.where(activity: @activity)
      # @slots_available.select! { |slot| slot.is_available == true }
      @booking = Booking.new
      # @slots = @activity.slots.where(is_available: true)
      # raise
      # @booking.activity = @activity
    end
  end

  def show
  end

  def my_bookings
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @bookings = Booking.where(user_id: current_user.id)
      @activity = Activity.where(id: current_user.slots.pluck(:activity_id).uniq)
    end
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      @booking.slot.update(is_available: false)
      redirect_to checkout_path(@activity.id, @booking.id)

    else
      render :new, status: :unprocessable_entity
    end
  end

  def checkout
    @activity = Activity.find(params[:activity_id])
    # @booking = Booking.new(booking_params)
    @booking.user = current_user
    @activity_price = @activity.price.to_f

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          quantity: 1,
          price_data: {
            unit_amount: (@activity_price * 100).to_i,
            currency: 'gbp',
            product_data: {
              name: "your booking",
              description: "Activity",
              images: ['https://example.com/t-shirt.png'],
            }
          }
        ],
        mode: "payment",
        success_url: "http://localhost:3000/activities/#{@activity.id}/bookings/#{@booking.id}",
        cancel_url: "http://localhost:3000/activities/#{@activity.id}/bookings/#{@booking.id}"
      )

        @booking.update(checkout_session_id: session.id)
      # redirect_to activity_booking_path(@activity.id, @booking.id)
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
    redirect_to bookings_path, see_status: :other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_party_size, :slot_id, :activity_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
