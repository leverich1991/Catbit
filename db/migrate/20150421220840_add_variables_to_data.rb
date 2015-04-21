class AddVariablesToData < ActiveRecord::Migration
  def change
    add_column :data, :date, :integer
    add_column :data, :steps_goal, :integer
    add_column :data, :distance_goal, :float
    add_column :data, :calories_goal, :integer
    add_column :data, :article_id, :integer
  end
end
