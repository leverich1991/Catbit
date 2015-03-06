class User < ActiveRecord::Base
before_save { self.username = username.downcase }
has_secure_password #should have built-in authentication
validates :name, presence: true, length: { minimum: 8 }
#validates :password, :format => {:with => /A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}/z, message: "must be at least 8 characters and include one number and one letter."}
end
