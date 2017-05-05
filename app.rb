require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'volunteer_tracker'})

DB.exec("DELETE FROM volunteers *;")
DB.exec("DELETE FROM projects *;")

get('/') do
  erb(:index)
end

get('/volunteers_home') do
  @all_volunteers = Volunteer.all
  erb(:volunteers_home)
end

get('/projects_home') do
  @all_projects = Project.all
  erb(:projects_home)
end

post('/new_volunteer') do
  new_name = params["name"]
  new_volunteer = Volunteer.new({:name => new_name, :id => nil})
  new_volunteer.save()
  @all_volunteers = Volunteer.all
  erb(:volunteers_home)
end

post('/new_project') do
  new_title = params["title"]
  new_project = Project.new({:title => new_title, :id => nil})
  new_project.save()
  @all_projects = Project.all
  erb(:projects_home)
end

get("/volunteers/:id") do
  id = params["id"]
  @found_volunteer = Volunteer.find_by_id(id)
  @found_project
  erb(:current_volunteer)
end

# get("/projects/:id") do
#   id = params["id"]
#   erb(:current_project)
# end
