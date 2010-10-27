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
  
end
