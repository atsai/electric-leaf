Before do
  # Add some users and residences
  @res1 = Residence.create!
  @res2 = Residence.create!
  User.create!(:name => "User A", :residence_id => @res1.id)
  User.create!(:name => "User B", :residence_id => @res1.id)
  User.create!(:name => "User C", :residence_id => @res1.id)
  User.create!(:name => "User D", :residence_id => @res2.id)
  User.create!(:name => "User E", :residence_id => @res2.id)
  User.create!(:name => "User F", :residence_id => @res2.id)
end
  