class SessionsController < ApplicationController
  #layout "_header"
  def new
  end
  def show
  #@catbit = Fitbit.find(params[:id])
  end
  def create
    #user = User.find_by(username: params[:username].downcase)
    #if user && user.authenticate(params[:password])
	  #log_in user #does not work yet
	  render 'main'
    #else
	  #flash[:danger] = 'Invalid username or password'
	  #render 'new'
	#end
  end
  def destroy
     log_out
  end
  def current_user
	User.find_by(id: session[:user_id])
  end
end

