class Chore < ActiveRecord::Base
  has_many :chore_associations
  has_many :users, :through => :chore_associations
  belongs_to :residence
  
  def validate
    puts "Validate being called!"
    validate_has_users
  end
  
  def validate_has_users
    if self.users.size == 0 then
      self.errors.add_to_base "You must assign at least one person to this chore."
    end
  end
  
  def sorted_users_string
    results = ""
    sorted_users = self.users.sort { |a,b| a.name.downcase <=> b.name.downcase }
    sorted_users.each do |roommate|
      results += (roommate.name + ", ")
    end
    results[0..-3]
  end
end
