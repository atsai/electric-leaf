class User < ActiveRecord::Base
  has_many :chores, :through => :chore_associations
  belongs_to :residence
  
  validates_numericality_of :residence_id
  
  def roommates
    results = []
    residence.users.each do |user|
      results << user if user != self
    end
    results
  end
  
  def roommates_string
    results = ""
    roommates.each do |roommate|
      results += (roommate.name + ", ")
    end
    results[0..-3]
  end

  def self.login(token)
    access_token = OAuth2::AccessToken.new(facebook_client, token)
    feed = access_token.get("/me")
    json = JSON.parse(feed)
    fb_id = json['id']
    logger.info feed.to_s
    user = User.find_by_fb_id(fb_id)
    if user
      user.access_token = token
    else
      user = registerUser(json,token)
    end
    user.id
  end

  def self.registerUser(json,token)
    user = User.new(:name=>json['name'], :email=>json["email"], :fb_id=>json["id"], :access_token=>token, :residence_id=>0)
    user.save!
  end

  def self.facebook_client
    OAuth2::Client.new(FACEBOOK_OAUTH_APP_ID, FACEBOOK_OAUTH_APP_SECRET, :site=> "https://graph.facebook.com")
  end

end
