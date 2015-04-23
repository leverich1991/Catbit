class SettingsController < ApplicationController

  def show
    @user = current_user
    @client = current_user.fitbit
    @daily_activity = @client.activities_on_date 'today'
  end
  
  
  def update
	@user = current_user
	@user.update(user_params)
	render 'show'
  end
  
  
  protected
  
  def user_params
    params.require(:user).permit(:name, :age, :height, :weight)
  end
  
end

