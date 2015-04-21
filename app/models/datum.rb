class Datum < ActiveRecord::Base
belongs_to :user
validates :steps, :steps_goal, :distance, :distance_goal, :calories, :calories_goal, :date, :presence =>true
end
