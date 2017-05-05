require 'volunteer'

describe('project') do

  describe('#title') do
    it('will return the title of the project') do
      test_project = Project.new({:title => 'planting trees', :id => nil})
      expect(test_project.title).to(eq("planting trees"))
    end
  end

  # describe("#id") do
  #   it("will return the id of a volunteer") do
  #     test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil})
  #     expect(test_volunteer.id).to(eq(nil))
  #   end
  # end
  #
  # describe('.all') do
  #   it("will start with no volunteers") do
  #     expect(Volunteer.all).to(eq([]))
  #   end
  # end
  #
  # describe('#save') do
  #   it("will save the volunteer to the database") do
  #     test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil})
  #     test_volunteer.save
  #     expect(Volunteer.all[0].id).to(eq(test_volunteer.id))
  #   end
  # end
  #
  # describe("#update") do
  #   it("updates a volunteer in the database with new info") do
  #     test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil})
  #     test_volunteer.save
  #     test_volunteer.update({:name => "Meatloaf"})
  #     expect(test_volunteer.name).to(eq("Meatloaf"))
  #   end
  # end
  #
  # describe("#delete") do
  #   it("deletes a volunteer from the database") do
  #     test_volunteer1 = Volunteer.new({:name => 'Taylor Swift', :id => nil})
  #     test_volunteer1.save
  #     test_volunteer2 = Volunteer.new({:name => 'Meatloaf', :id => nil})
  #     test_volunteer2.save
  #     test_volunteer1.delete
  #     expect(Volunteer.all[0].name).to(eq('Meatloaf'))
  #   end
  # end

end
