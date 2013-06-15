class SuppliersController < ApplicationController
	
	before_filter :authenticate_supplier!

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
