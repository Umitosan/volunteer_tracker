require 'spec_helper'
require 'project'


describe('Volunteer') do

  describe("#name") do
    it("will return the name of the volunteer") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      expect(test_volunteer.name).to(eq("Taylor Swift"))
    end
  end

  describe("#id") do
    it("will return the id of a volunteer") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
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
      test_volunteer1 = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      test_volunteer1.save
      test_volunteer2 = Volunteer.new({:name => 'Dean Ween', :id => nil, :project_id => nil})
      test_volunteer2.save
      expect(Volunteer.all[0].id).to(eq(test_volunteer1.id))
    end
  end

  describe('#project_id') do
    it("will save the volunteer to the database") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      test_volunteer.save
      expect(test_volunteer.project_id).to(eq(nil))
    end
  end

  describe("#update") do
    it("updates a volunteer in the database with new info") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      test_volunteer.save
      test_volunteer.update({:name => "Meatloaf"})
      expect(test_volunteer.name).to(eq("Meatloaf"))
    end
  end

  describe("#delete") do
    it("deletes a volunteer from the database") do
      test_volunteer1 = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      test_volunteer1.save
      test_volunteer2 = Volunteer.new({:name => 'Meatloaf', :id => nil, :project_id => nil})
      test_volunteer2.save
      test_volunteer1.delete
      expect(Volunteer.all[0].name).to(eq('Meatloaf'))
    end
  end

  describe("#add_project") do
    it("adds a project id to a volunteer in the database") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      test_volunteer.save
      test_project = Project.new({:title => 'plant trees', :id => nil})
      test_project.save
      test_volunteer.add_project(test_project.id)
      pg_results = DB.exec("SELECT * FROM volunteers WHERE id = #{test_volunteer.id};")
      expect(pg_results[0]['project_id'].to_i).to(eq(test_project.id))
    end
  end

  describe(".find_by_id") do
    it("finds a volunteer in the database using its id") do
      test_volunteer1 = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      test_volunteer1.save
      test_volunteer2 = Volunteer.new({:name => 'Frank Zappa', :id => nil, :project_id => nil})
      test_volunteer2.save
      returned_volunteer = Volunteer.find_by_id(test_volunteer2.id)
      expect(returned_volunteer.id).to(eq(test_volunteer2.id))
    end
  end

  describe("get_project_of_vol") do
    it("finds the single project associated with a given volunteer") do
      test_volunteer = Volunteer.new({:name => 'Taylor Swift', :id => nil, :project_id => nil})
      test_volunteer.save
      test_project = Project.new({:title => 'plant trees', :id => nil})
      test_project.save
      test_volunteer.add_project(test_project.id)
      volunteers_project = test_volunteer.get_project_of_vol
      expect(volunteers_project.id).to(eq(test_project.id))
    end
  end

end
