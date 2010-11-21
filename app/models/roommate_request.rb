class RoommateRequest < ActiveRecord::Base
  belongs_to :user
  
  def requester
    User.find_by_id(requester_id)
  end
  
  def requester_name
    requester.name
  end
  
end
