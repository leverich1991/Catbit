class GoalsController < ApplicationController
  
  def index
    @goals = current_user.fitbit.goals["goals"]
  end
  
  def new
  end
  
  def show
  end
  
  def create
  end
  
  def update
    #sample, we will integrate this with our form submission
	current_user.fitbit.create_or_update_daily_goal(type: :steps, value: 1000)
	current_user.fitbit.create_or_update_daily_goal(type: :caloriesOut, value: 2000)
	current_user.fitbit.create_or_update_daily_goal(type: :distance, value: 10)
	render 'index'
  end
 
  protected  
  
  def change_goals
    User.find_by(id: session[:user_id])
    @client = current_user.fitbit
	@client.create_or_update_daily_goal(@opts)
	render 'goals'
  end
  
  def goal_params
    params.require(:user).permit(:input, :points)
  end
end

