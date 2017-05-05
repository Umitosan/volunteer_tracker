require 'spec_helper'
require 'project'


describe('Volunteer') do

  describe("#name") do
    it("will return the name of the volunteer") do
      test_volunteer = Volunteer.new({'name' => 'Taylor Swift', 'id' => nil})
      expect(test_volunteer.name).to(eq("Taylor Swift"))
    end
  end

  describe("#id") do
    it("will return the id of a volunteer") do
      test_volunteer = Volunteer.new({'name' => 'Taylor Swift', 'id' => nil})
      expect(test_volunteer.id).to(eq(nil))
    end
  end

  describe('.all') do
    it("will start with no volunteers") do
      expect(Volunteer.all).to(eq([]))
    end
  end

end


# test_volunteer = Volunteer.new({'name' => 'Taylor Swift', 'id' => nil})
