class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #t.string :username
      #t.text :password_digest
	#  t.integer :points



      t.string :name
      t.string :email
      t.string :uid
      t.string :oauth_token
      t.string :oauth_secret
      t.string :provider


      t.timestamps null: false
    end
  end
end
