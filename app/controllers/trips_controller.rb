class TripsController < ApplicationController
  before_action :set_trip, only: %i[update destroy show]
	before_action :authenticated

  def index
    render json: current_user.trips.order(updated_at: :asc), include: [ :activities ]
  end

	def show
		render json: @trip, include: [:activities], status: :ok
	end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      # This is if it saves succesfully
      render json: @trip, status: :created
    else
      # This is if it errors out
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def update
    if @trip.update(trip_params)
      render json: @trip, status: :ok
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :country, :length, :user_id)
  end
end
