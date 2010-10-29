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
end
