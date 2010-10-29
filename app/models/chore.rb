class Chore < ActiveRecord::Base
  has_many :chore_associations
  has_many :users, :through => :chore_associations
end
