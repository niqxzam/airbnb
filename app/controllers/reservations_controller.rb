class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show]

  def index
  	@reservations = current_user.reservations.all 

  end

  def new
  	@reservation = Reservation.new
  	@listing = Listing.find(params[:listing_id])
  end

  def create
  	@reservation = Reservation.new(reservation_params)
  	@reservation.user_id = current_user.id
  	@reservation.listing_id = Listing.find(params[:listing_id]).id
    respond_to do |format|
      if @reservation.save
        ReservationJob.perform_now(current_user, User.find(86), @reservation.listing_id)
        format.html { redirect_to listing_reservations_path, notice: 'Airbnb was successfully reserved!' }

      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :num_guest, :listing_id)
  end

end