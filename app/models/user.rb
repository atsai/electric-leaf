class User < ActiveRecord::Base
  has_many :chores, :through => :chore_associations
  belongs_to :residence
  
  validates_numericality_of :residence_id
end
