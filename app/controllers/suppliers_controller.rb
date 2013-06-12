class SuppliersController < ApplicationController

	def index
	end

	def show
		@supplier = Supplier.find(params[:id])
	end

	def edit
		@supplier = Supplier.find(params[:id])
	end

	def update
	end

end
