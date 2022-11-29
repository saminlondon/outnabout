class SlotsController < ApplicationController
  def index
    @slots = Slot.all
  end

  def new
    @slot = Slot.new
  end

  def show
    @slot = Slot.find(params[:id])
  end

  def create
    @slot = Slot.new(slot_params)
    @slot.save
  end

  def edit
    @slot = Slot.find(params[:id])
  end

  def update
    @slot = Slot.find(params[:id])
    @slot.update(slot_params)
    redirect_to slot_path(@slot)
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy!
  end

  private

  def slot_params
    params.require(:slot).permit(:start_time, :end_time, :is_available)
  end

end
