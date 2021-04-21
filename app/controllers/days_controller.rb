class DaysController < ApplicationController
  before_action :authenticate_user

  def index
    @days = Day.all
    render json: @days
  end

  def show
    @day = Day.find(params[:id])
    render json: @day
  end

  def create
    @day = Day.new
    @day.date = Date.parse(params[:date])
    @day.start_time = DateTime.parse(@day.date.to_s + " #{params[:start_time]}")
    @day.end_time = DateTime.parse(@day.date.to_s + " #{params[:end_time]}")
    @day.slot_length = params[:slot_length]
    @day.slot_capacity = params[:slot_capacity]
    if @day.save
      time = @day.start_time.to_time
      while time < @day.end_time.to_time do
        @day.slots.create(time: DateTime.parse(time.to_s), capacity: @day.slot_capacity)
        time += @day.slot_length
      end
      render json: {
        day: @day,
        slots: @day.slots
      }, status: 201
    else
      puts @day.errors.messages
      render json: {
        error: "Something went wrong"
      }, status: 400
    end
  end

  def destroy
    @day = Day.find(params[:id])
    @day.destroy
  end

  private
  def day_params
    params.require(:day).permit(:date, :start_time, :end_time, :slot_length, :slot_capacity)
  end
end
