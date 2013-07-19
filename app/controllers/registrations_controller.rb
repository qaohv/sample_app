    class RegistrationsController < Devise::RegistrationsController

  def create
  	@user = User.new(user_params)
  	 if @user.save
  	 	sign_in @user
  	 	flash[:success] = "You signed up successfully"
  	 	redirect_to root_url
  	 else 
  	 	render 'new'
  	 end
  end


  def update

  	@user = User.find(current_user.id)
  	
  	new_username = params[:user][:username] 
  	unless new_username.blank?
  		@user.update_attributes(username: new_username) unless new_username == @user.username
  	end	

  	new_timezone = params[:user][:timezone]
	 		@user.update_attributes(timezone: new_timezone) unless new_timezone == @user.timezone
  	  	
   	super
  
  end


 private
 	def user_params
 		params.require(:user).permit(:username, :email, :password, :password_confirmation, :timezone)
 	end

end