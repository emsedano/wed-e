class WeddiesController < ApplicationController
	
	before_filter :authenticate_weddy!
	
	def index 
		
	end

	def show
		@weddy = Weddy.find(params[:id])
	    @requirements = @weddy.requirements
	    @categories = Category.all
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

	# add requirement
	def add_requirement
		
		req = Requirement.new
		req.weddy_id = current_weddy.id
		req.category_id = params[:id]
		req.save

		flash[:success] = "Profile updated"


		redirect_to current_weddy
	end

end
