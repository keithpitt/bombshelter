class RegistrationsController < ApplicationController

   layout 'interior'

	include ActiveMerchant::Billing

   def index
	   
	   globals

	   @registration = Registration.new

	   if request.post?
			
		    post = params[:registration]
			
			6.times do |i|
				key = 'attendee_' + i.to_s + '_competitions'
				post[key] = post[key].join(', ') if post[key]
			end

		   @registration.update_attributes post
		   
		   if @registration.save

			   # Update the prices
			   @registration.update_prices(@prices)

			   session[:registration] = @registration

			   setup_response = gateway.setup_purchase(@registration.total_cents,
				   :ip                => request.remote_ip,
				   :return_url        => url_for(:action => 'confirm', :only_path => false),
				   :cancel_return_url => url_for(:action => 'index', :only_path => false)
			   )

			   redirect_to gateway.redirect_url_for(setup_response.token)
			
		   end

	   end

   end

   def confirm
	   globals
	   @registration = session[:registration]
   end

   def complete
	   globals
	   @registration = session[:registration]

	   purchase = gateway.purchase(@registration.total_cents,
		   :ip       => request.remote_ip,
		   :payer_id => params[:PayerID],
		   :token    => params[:token]
	   )

	  if !purchase.success?
		  @message = purchase.message
		  render :action => 'error'
		  return
	  end

	  @registration.finalize! @attendent_types

	  session[:registration] = nil

   end

   private

   def globals
	   @attendent_types = [["Magician", "M"], ["Spouse/Partner", "SP"], ["Junior (Under 16)", "J"], ["Saturday Attendance Only", "SA"], ["Sunday Attendance Only", "SU"], ["Extra Banquet Ticket", "B"]]
	   @competitions = ["Junior Close Up", "Open Close Up", "Open Stage"]

	   # Handle early bird prices
	   if Date.today > Date.parse("1 July 2009")
		   @prices = {
				:M => 250,
				:SP => 200,
				:J => 200,
				:SA => 150,
				:SU => 100,
				:B => 60
		   }
	   else
		   @prices = {
				:M => 240,
				:SP => 190,
				:J => 190,
				:SA => 150,
				:SU => 100,
				:B => 60
		   }
	   end
   end

   def gateway
	   @gateway ||= PaypalExpressGateway.new(
		   :login => PAYPAL_LOGIN,
		   :password => PAYPAL_PASSWORD,
		   :signature => PAYPAL_SIG
	   )
   end

end
