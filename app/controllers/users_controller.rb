class UsersController < ApplicationController
	
	before_filter :authenticate_user!
	
	def index 
		print "index for user has been called"

		if current_user.role == "weddy"	
		    @weddy = current_user   
			sign_in_and_redirect(:weddy, @weddy)
		elsif current_user.role == "supplier"
			@supplier = current_user
			sign_in_and_redirect(:supplier, @supplier)
		else		   
			#sign_in_and_redirect(:user, @user)
			redirect_to edit_user_path(current_user)
		end

		
	end

	def show
		@user = User.find(params[:id])
		if @user.role == "weddy"		   
		   #@weddy = Weddy.find(@user.id)
		   sign_in_and_redirect(:weddy, current_user)
		   #redirect_to @weddy 
		elsif @user.role == "supplier"
			sign_in_and_redirect(:supplier, current_user)
		    #@supplier = Supplier.find(@user.id)
			#redirect_to @supplier	
		else		   
		   redirect_to edit_user_path(current_user)
		   
		end
	end

	def edit
		print "edit called"
		@user = User.find(params[:id])
		if @user.role == "weddy"
			print "user-weddy"
			#redirect_to weddies_path
			redirect_to :controller => "weddies", :action => "edit", :id => params[:id]
		end
		
		if @user.role == "supplier"
			print "user-supplier"
			#redirect_to suppliers_path
			redirect_to :controller => "weddies", :action => "edit", :id => params[:id]
		end
		print "no role identified render edit"
	end

	def update
		@user = User.find(params[:id])
	    if @user.update_attributes(params[:user])
	      flash[:success] = "Profile updated"
	      sign_in @user
	      redirect_to @user
	    else
	      render 'edit'
	    end
	end
end
