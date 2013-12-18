class CartsController < ApplicationController
  
  #layout "fixed_bottom_navbar"
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
    @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to @cart, :notice => 'Invalid Cart'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
    end
  end


#New & Create methods are from stripe
  def create
    # Amount in cents
    @amount = params[:amount_to_capture]#check _cart.html.erb for hidden form [:amount_to_capture]
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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    #Actionmailer here
    redirect_to carts_path
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to :controller => "gallery", :action => "index"
  end
end
