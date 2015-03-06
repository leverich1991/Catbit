class DataController < ApplicationController
  def show
    @datum = Datum.where(user_id: current_user).first
  end
end
