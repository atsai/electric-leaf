class Residence < ActiveRecord::Base
  has_many :users
end
