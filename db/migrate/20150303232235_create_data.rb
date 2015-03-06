class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :user_id, :index
      t.integer :steps
      t.float :distance
      t.integer :calories
      t.integer :points

      t.timestamps null: false
    end
  end
end
