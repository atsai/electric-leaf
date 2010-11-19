class User < ActiveRecord::Base
  has_many :chore_associations
  has_many :chores, :through => :chore_associations
  has_one :roommate_request
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
    roommates.sort! { |a,b| a.name.downcase <=> b.name.downcase }
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
    residence = Residence.new()
    residence.save!
    user = User.new(:name=>json['name'], :email=>json["email"], :fb_id=>json["id"], :access_token=>token, :residence_id=>residence.id)
    user.save!
    user
  end

  def self.facebook_client
    OAuth2::Client.new(FACEBOOK_OAUTH_APP_ID, FACEBOOK_OAUTH_APP_SECRET, :site=> "https://graph.facebook.com")
  end

end
