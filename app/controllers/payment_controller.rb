class PaymentController < ApplicationController
  	def paynow
	end

	def stripe_gateway
	  # Amount in cents
	  if request.post?
		  @amount = params[:amount]
		  @user = User.find(session[:user])

		  customer = Stripe::Customer.create(
		    :email => @user.login_email,
		    :card  => params[:stripeToken]
		  )

		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount,
		    :description => 'OpenSpace Customer',
		    :currency    => 'usd'
		  )

		#rescue Stripe::CardError => e #24 flash[:error] = e.message
		  
		  redirect_to :controller=>"gallery",:action=>"index"
		end
	end
end
#