class SessionsController < ApplicationController
  def new
  end
  def show
  @catbit = Fitbit.find(params[:id])
  end
  def calories
  @client = current_user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  def steps
  @client = current_user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  def distance
  @client = current_user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  
  def main
	#@user = User.find_or_create_from_auth_hash(auth_hash)
  #self.current_user = @user
  auth_hash = request.env['omniauth.auth']
 
  # Log him in or sign him up
  user = User.find_or_create(auth_hash)
 
  # Create the session
  session[:user_id] = user.id
  
  @client = user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  #render :text => daily_activity  
  end
  
  def create
  #@user = User.find_or_create_from_auth_hash(auth_hash)
  #self.current_user = @user
  auth_hash = request.env['omniauth.auth']
 
  # Log him in or sign him up
  user = User.find_or_create(auth_hash)
 
  # Create the session
  session[:user_id] = user.id
  
  @client = user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  #render :text => daily_activity  
  render 'main'  
  end
  #def destroy
  #@session = nil
  #end
  def current_user
	User.find_by(id: session[:user_id])
  end
  
  def destroy
    session[:user_id] = nil
    render 'new'
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  protected

  #def auth_hash
  #  request.env['omniauth.auth']
  #end
end

