require 'spec_helper'
require 'project'


describe('Volunteer') do

  describe("#name") do
    it("will return the name of the volunteer") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil})
      expect(test_volunteer.name).to(eq("Taylor Swift"))
    end
  end

  describe("#id") do
    it("will return the id of a volunteer") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil})
      expect(test_volunteer.id).to(eq(nil))
    end
  end

  describe('.all') do
    it("will start with no volunteers") do
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe('#save') do
    it("will save the volunteer to the database") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil})
      test_volunteer.save
      expect(Volunteer.all[0].id).to(eq(test_volunteer.id))
    end
  end

end
