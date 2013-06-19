class WeddiesController < ApplicationController
	
	before_filter :authenticate_weddy!
	
	def index 
	end

	def show
		@weddy = Weddy.find(params[:id])
	end

	def edit
		@weddy = Weddy.find(params[:id])
	end

	def update
		@weddy = Weddy.find(params[:id])
	    if @weddy.update_attributes(params[:weddy])
	      flash[:success] = "Profile updated"
	      redirect_to @weddy
	    else
	      render 'edit'
	    end
	end



end
