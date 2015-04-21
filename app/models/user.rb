class User < ActiveRecord::Base
has_many :datas
validates :oauth_token, :oauth_secret, :uid, :name, :presence =>true
def self.find_or_create(auth_hash)
    unless user = find_by_uid(auth_hash["uid"])
      user = User.create :oauth_token => auth_hash['credentials']['token'], :oauth_secret => auth_hash['credentials']['secret'], :uid => auth_hash["uid"], :name => auth_hash['info']["full_name"]
end
 
user
end
  
def fitbit
    client = Fitgem::Client.new(:consumer_key => '112ab647273543b89fc58ad1e4932be1', :consumer_secret => '0d31c388f89e4b50bd878002ac354a4a', :oauth_token => self.oauth_token, :oauth_secret => self.oauth_secret)
    access_token = client.reconnect(self.oauth_token, self.oauth_secret)
    client
end

end
