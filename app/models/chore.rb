class Chore < ActiveRecord::Base
  has_many :users, :through => :chore_associations
end
