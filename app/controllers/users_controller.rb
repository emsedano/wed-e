class UsersController < ApplicationController
	
	before_filter :authenticate_user!
	
	def index 
	end

	def show
		@user = User.find(params[:id])
		if @user.role == "weddy"		   
		   @weddy = Weddy.find(@user.id)
		   redirect_to @weddy 
		elsif @user.role == "supplier"
		   @supplier = Supplier.find(@user.id)
			redirect_to @supplier	
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
	end
end
