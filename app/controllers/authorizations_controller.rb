class AuthorizationsController < ApplicationController
	before_filter :authenticate_user!, :except => [:create]
	before_filter :authenticate_weddy!, :except => [:create]
	before_filter :authenticate_supplier!, :except => [:create]
	
	def index
  	end
  
  	def create
	 omniauth = request.env['omniauth.auth']
	 if omniauth
	    omniauth['info']['email'] ? email =  omniauth['info']['email'] : email = ''
	    omniauth['info']['name'] ? name =  omniauth['info']['name'] : name = ''
	    omniauth['uid'] ?  uid =  omniauth['uid'] : uid = ''
	    omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''
	    
		if email == "" 
	    		email =  omniauth['extra']['raw_info']['username'] + "@facebook.com"
	    end
	    
	    @user = User.find_by_email(email)
	    
	    #a menos que exista el usuario
	    if @user != nil
	    	print "user exist with role : " + @user.role
	    	if @user.role == "weddy"	
		    	@weddy = @user   
				sign_in_and_redirect(:weddy, @weddy)
			elsif @user.role == "supplier"
				@supplier = @user
				sign_in_and_redirect(:supplier, @supplier)
			else		   
				sign_in_and_redirect(:user, @user)
			end
	    else

	    	new_user = User.new
	    	new_user.email = email
	    	new_user.name = name
	    	new_user.password = uid
	    	new_user.save
	    	
			
	    	#:provider, :uemail, :uid, :uname, :user_id
	    	auth = Authorization.new
	    	auth.user = new_user
	    	auth.provider = provider
	    	auth.uid = uid
	    	auth.uname = name
	    	auth.uemail = email
	    	auth.save
	    	sign_in_and_redirect(:user, new_user)
	    	#redirect_to :controller => "users", :action => "edit", :id => new_user.id

	    end

	    
	    #render :text => uid.to_s + " - " + name + " - " + email + " - " + provider
	  else
	    render :text => 'Error: Omniauth is empty'
	  end
  	end

end
