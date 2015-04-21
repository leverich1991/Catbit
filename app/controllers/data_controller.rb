class DataController < ApplicationController
  def show
    @datum = Datum.where(user_id: current_user).first
  end
  def create(data_hash)
    @user = User.find_by(id: session[:user_id])
    @data = @user.datas.create(data_hash)
  end
  def change_goals
    @client = current_user.fitbit
	@client.create_or_update_daily_goal(@opts)
	render 'goals'
  end
  def points_algorithm
	if @daily_activity['goals']['steps']
	@points = (@daily_activity['goals']['steps'] * 0.1)
	elsif @daily_activity['goals']['distance']
	@points = (@daily_activity['goals']['distance'] * 10)
	else
	@points = (@daily_activity['goals']['caloriesOut'] * 0.1)
	end
  end
end
