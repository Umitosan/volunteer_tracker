require 'project'

describe('project') do

  describe('#title') do
    it('will return the title of the project') do
      test_project = Project.new({:title => 'plant trees', :id => nil})
      expect(test_project.title).to(eq("plant trees"))
    end
  end

  describe("#id") do
    it("will return the id of a project") do
      test_project = Project.new({:title => 'plant trees', :id => nil})
      expect(test_project.id).to(eq(nil))
    end
  end

  describe('.all') do
    it("will start with no projects") do
      expect(Project.all).to(eq([]))
    end
  end

  describe('#save') do
    it("will save the project to the database") do
      test_project = Project.new({:title => 'plant trees', :id => nil})
      test_project.save
      expect(Project.all[0].id).to(eq(test_project.id))
    end
  end

  describe("#update") do
    it("updates a project in the database with new info") do
      test_project = Project.new({:title => 'plant trees', :id => nil})
      test_project.save
      test_project.update({:title => "serve at the soup kitchen"})
      expect(test_project.title).to(eq("serve at the soup kitchen"))
    end
  end

  #
  # describe("#delete") do
  #   it("deletes a project from the database") do
  #     test_project1 = project.new({:title => 'Taylor Swift', :id => nil})
  #     test_project1.save
  #     test_project2 = project.new({:title => 'Meatloaf', :id => nil})
  #     test_project2.save
  #     test_project1.delete
  #     expect(project.all[0].title).to(eq('Meatloaf'))
  #   end
  # end

end
