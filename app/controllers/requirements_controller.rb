class RequirementsController < ApplicationController
	before_filter :authenticate_weddy!
	
	def create
    	@requirements = current_weddy.requirements.build(params[:requirement])
    	if @requirements.save
      		flash[:success] = "Vientos, Su requerimiento has sido agregado!"
      		#redirect_to root_url
      		redirect_to current_weddy
    	else
      	@requirements = []
      		redirect_to root_url
      end
  end
  
  def destroy
    @requirement = Requirement.find(params[:id])
    
    if @requirement.destroy
      flash[:success] = "Su requerimiento has sido eliminado!"
      #redirect_to root_url
      redirect_to(current_weddy)
    else
      flash[:failure] = "Su requerimiento has sido eliminado!"
      #redirect_to root_url
      redirect_to(current_weddy)
    end

    
   
  end


end
