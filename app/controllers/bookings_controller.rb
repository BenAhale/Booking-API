class BookingsController < ApplicationController
  before_action :authenticate_user

  def index
    render json: {
      bookings: current_user.bookings
    }
  end

  def show
    @booking = Booking.find(params[:id])
    render json: @booking
  end

  def create
    @slot = Slot.find(params[:slot])
    @booking = current_user.bookings.create(slot: @slot)
    if @booking.save
      render json: @booking, status: 201
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

end
