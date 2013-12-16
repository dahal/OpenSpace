class AccountsController < ApplicationController
  def signup
   	@user = User.new
    if request.post?
      @user = User.new(params[:user])
      if @user.save
        
        SignupMailer.signup_confirmation(@user).deliver
        redirect_to :action=>"login", notice: 'You successfully logged in'
      else
        render :action=>"signup", error: 'Sorry something went wrong'
      end
    end
  end

  def login
    # User types in the info:
    # password (hashed in database), user types in the password (text/number), we will encrypt it again and comare with hashed password at database.
    if request.post?
      @user = User.authenticate(params[:user][:login_email],params[:user][:password])
      session[:user]=@user.id
      if @user
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
          @user = User.find_by_login_email(params[:user][:login_email])
          if @user
            new_password = random_password
            @user.update_attributes(:password=>new_password)
            SignupMailer.random_password_send(@user,new_password).deliver
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
      @user = User.find(session[:user])
      if @user
      @user.update_attributes(:password=>params[:user][:password])
      SignupMailer.reset_password_confirmation(@user).deliver
      flash[:notice] = "Your password has been reset"
            redirect_to :action=>"login"
      else
        render :action=>reset_password
        flash[:notice] = "Invalid password, try again or sign up for new account"
      end
    end 
  end


  def dashboard
    @user = User.find(session[:user])
    
  end

  def logout
    session[:user]=nil
    session[:cart_id]=nil
    flash[:notice]="You are logged out"
    redirect_to :action=>"login"
  end

end