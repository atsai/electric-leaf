class User < ActiveRecord::Base
  has_many :chores, :through => :chore_associations
end
