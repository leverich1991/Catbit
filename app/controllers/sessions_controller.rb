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
  auth_hash = request.env['omniauth.auth']
 
  # Log him in or sign him up
  user = User.find_or_create(auth_hash)
 
  # Create the session
  session[:user_id] = user.id
  
  @client = user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  
  def create
  auth_hash = request.env['omniauth.auth']
 
  # Log him in or sign him up
  user = User.find_or_create(auth_hash)
 
  # Create the session
  session[:user_id] = user.id
  
  @client = user.fitbit
  Datum.delete_all
  @daily_activity = @client.activities_on_date 'today'
  retreive_week_data
  render 'main'
  #redirect_to 'main' Does not work  
  end
  # Used for Settings page
  def current_user
	User.find_by(id: session[:user_id])
  end
  # Used for Goals page
  def change_goals
    User.find_by(id: session[:user_id])
    @client = current_user.fitbit
	@client.create_or_update_daily_goal(@opts)
	render 'goals'
  end
  # Also used for Goals page
  def points_algorithm
	if current_user[:input] = "Calories"
	current_user[:points] = (@daily_activity['goals']['steps'] * 0.1)
	elsif current_user[:input] = "Distance"
	current_user[:points] = (@daily_activity['goals']['distance'] * 10)
	elsif current_user[:input] = "Steps"
	current_user[:points] = (@daily_activity['goals']['caloriesOut'] * 0.1)
	end
  end
  def update
	if current_page?('sessions/settings')
	#if (params[:action] == 'settings.1')
	current_user.update(user_params)
	render 'settings'
	elsif current_page?('sessions/goals')
	#elsif (params[:action] == 'goals.1')
	current_user.update(goal_params)
	@client.create_or_update_daily_goal(@opts)
	@points_algorithm = current_user[:points]
	render 'goals'
	end
  end
  def destroy
    session[:user_id] = nil
    render 'new'
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  protected
  def retreive_week_data
    @daily_activity = @client.activities_on_date 'today'
    Datum.create :steps => @daily_activity['summary']['steps'], :steps_goal => @daily_activity['goals']['steps'], :distance => @daily_activity['summary']['distances'][0]['distance'] , :distance_goal => @daily_activity['goals']['distance'], :calories => @daily_activity['summary']['caloriesOut'], :calories_goal => @daily_activity['goals']['caloriesOut'], :date => 0
    
    @daily_activity = @client.activities_on_date (Time.now-1.day)
    Datum.create :steps => @daily_activity['summary']['steps'], :steps_goal => @daily_activity['goals']['steps'], :distance => @daily_activity['summary']['distances'][0]['distance'] , :distance_goal => @daily_activity['goals']['distance'], :calories => @daily_activity['summary']['caloriesOut'], :calories_goal => @daily_activity['goals']['caloriesOut'], :date => 1

    @daily_activity = @client.activities_on_date (Time.now-2.day)
    Datum.create :steps => @daily_activity['summary']['steps'], :steps_goal => @daily_activity['goals']['steps'], :distance => @daily_activity['summary']['distances'][0]['distance'] , :distance_goal => @daily_activity['goals']['distance'], :calories => @daily_activity['summary']['caloriesOut'], :calories_goal => @daily_activity['goals']['caloriesOut'], :date => 2

    @daily_activity = @client.activities_on_date (Time.now-3.day)
    Datum.create :steps => @daily_activity['summary']['steps'], :steps_goal => @daily_activity['goals']['steps'], :distance => @daily_activity['summary']['distances'][0]['distance'] , :distance_goal => @daily_activity['goals']['distance'], :calories => @daily_activity['summary']['caloriesOut'], :calories_goal => @daily_activity['goals']['caloriesOut'], :date => 3

    @daily_activity = @client.activities_on_date (Time.now-4.day)
    Datum.create :steps => @daily_activity['summary']['steps'], :steps_goal => @daily_activity['goals']['steps'], :distance => @daily_activity['summary']['distances'][0]['distance'] , :distance_goal => @daily_activity['goals']['distance'], :calories => @daily_activity['summary']['caloriesOut'], :calories_goal => @daily_activity['goals']['caloriesOut'], :date => 4

    @daily_activity = @client.activities_on_date (Time.now-5.day)
    Datum.create :steps => @daily_activity['summary']['steps'], :steps_goal => @daily_activity['goals']['steps'], :distance => @daily_activity['summary']['distances'][0]['distance'] , :distance_goal => @daily_activity['goals']['distance'], :calories => @daily_activity['summary']['caloriesOut'], :calories_goal => @daily_activity['goals']['caloriesOut'], :date => 5

    @daily_activity = @client.activities_on_date (Time.now-6.day)
    Datum.create :steps => @daily_activity['summary']['steps'], :steps_goal => @daily_activity['goals']['steps'], :distance => @daily_activity['summary']['distances'][0]['distance'] , :distance_goal => @daily_activity['goals']['distance'], :calories => @daily_activity['summary']['caloriesOut'], :calories_goal => @daily_activity['goals']['caloriesOut'], :date => 6
  end
  def user_params
    params.require(:user).permit(:name, :age, :height, :weight)
  end
  def goal_params
    params.require(:user).permit(:input, :points)
  end
end

