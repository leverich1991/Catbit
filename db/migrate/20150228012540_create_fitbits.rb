class CreateFitbits < ActiveRecord::Migration
  def change
    create_table :fitbits do |t|
	  t.integer :user_id
      t.integer :calories
	  t.integer :steps
	  t.integer :distance

      t.timestamps null: false
    end
  end
end
