class ListerController < ApplicationController
  def signup
   	@lister = Lister.new
    if request.post?
      @lister = Lister.new(params[:lister])
      if @lister.save
        
        #SignupMailer.signup_confirmation(@lister).deliver
        redirect_to :action=>"login", notice: 'You successfully logged in'
      else
        render :action=>"signup", error: 'Sorry something went wrong'
      end
    end
  end

  def login
    # Lister types in the info:
    # password (hashed in database), lister types in the password (text/number), we will encrypt it again and comare with hashed password at database.
    if request.post?
      @lister = Lister.authenticate(params[:lister][:email],params[:lister][:password])
      session[:lister]=@lister.id
      if @lister
        flash[:notice] = "Successfully signed in"
            if session[:cart_id]
              redirect_to :controller => "carts/#{session[:cart_id]}"
            else
              redirect_to :action=>"dashboard"
            end
        
      else
          render :action =>"login"
          flash[:notice] = "Invalid email/password, try again"
      end
    end 

  end

  def forgot_password
      if request.post?
          @lister = Lister.find_by_email(params[:lister][:email])
          if @lister
            new_password = random_password
            @lister.update_attributes(:password=>new_password)
            SignupMailer.random_password_send(@lister,new_password).deliver
            flash[:notice] = "New password has been sent to your email"
            redirect_to :action=>"login"
          else
            render :action=>forgot_password
            flash[:notice] = "Invalid email, try again or sign up for new account"
          end
      end
  end

  def random_password
    (0...8).map{65.+(rand(25)).chr}.join 
  end

  def reset_password
    if request.post?
      @lister = Lister.find(session[:lister])
      if @lister
      @lister.update_attributes(:password=>params[:lister][:password])
      SignupMailer.reset_password_confirmation(@lister).deliver
      flash[:notice] = "Your password has been reset"
            redirect_to :action=>"login"
      else
        render :action=>reset_password
        flash[:notice] = "Invalid password, try again or sign up for new account"
      end
    end 
  end

  def logout
    session[:lister]=nil
    session[:cart_id]=nil
    flash[:notice]="You are logged out"
    redirect_to :action=>"login"
  end


  def dashboard
    @lister = Lister.find(session[:lister])
  end
end
