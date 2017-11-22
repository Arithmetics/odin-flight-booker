class PassengerMailer < ApplicationMailer
  default from: 'bookings@example.com'

  def thank_you_email(passenger)
    @passenger = passenger
    @flight = @passenger.flights.first
    mail(to: @passenger.email, subject: 'Thank you for booking your flight!')
  end
end
