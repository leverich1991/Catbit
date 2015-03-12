class SessionsController < ApplicationController
  #layout "_header"
  def new
  end
  def show
  @catbit = Fitbit.find(params[:id])
  end
  def create
  #@user = User.find_or_create_from_auth_hash(auth_hash)
  #self.current_user = @user
  render 'main'  
  end
  def destroy
  @session = nil
  end
  def current_user
	User.find_by(id: session[:user_id])
  end
  
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

