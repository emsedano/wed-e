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
	end



end
