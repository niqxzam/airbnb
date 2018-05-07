class ReservationMailer < ApplicationMailer
 def booking_email(customer, host, reservation_id)
 	@customer = customer
 	@host = host
 	@reservation_id = reservation_id
 	@url = 'localhost:3000/listings/:id/reservation'
 	mail(to: @host.email, subject: 'Your house has recently been booked!')
 end
end