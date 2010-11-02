class BillAssociation < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill
end
