class AdminsController < ApplicationController
	layout "admin"
	def login
		if request.post?
			
			if params[:admin][:admin_username]=="adminusername" && params[:admin][:password]=="adminpassword"
				session[:admin] = "admin"
				redirect_to :controller=>"list_spaces"

			else
				render :action=>"index"
				flash[:notice] = "Invalid user/password, try again"
			end
		end 
	end

	def logout
	session[:admin]=nil
    flash[:notice]="You are logged out"
    redirect_to :action=>"login"
		
	end
end
