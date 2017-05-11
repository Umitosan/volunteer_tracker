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


### VOLUNTEERS_HOME.ERB
get('/volunteers_home') do
  @all_volunteers = Volunteer.all
  erb(:volunteers_home)
end

post('/new_volunteer') do
  new_name = params["name"]
  if (new_name.length != 0)
    new_volunteer = Volunteer.new({:name => new_name, :id => nil})
    new_volunteer.save()
  end
  @all_volunteers = Volunteer.all
  erb(:volunteers_home)
end

get('/volunteers/:id') do
  id = params["id"].to_i
  @found_volunteer = Volunteer.find_by_id(id)
  @found_project = @found_volunteer.get_project_of_vol()
  @all_projects = Project.all
  erb(:current_volunteer)
end
########################


# PROJECTS_HOME.ERB
get('/projects_home') do
  @all_projects = Project.all
  erb(:projects_home)
end

get('/projects/:id') do
  id = params["id"].to_i
  @found_proj = Project.find_by_id(id)
  @found_volunteers_list = @found_proj.get_vols_on_proj()
  @all_volunteers = Volunteer.all
  erb(:current_project)
end

post('/new_project') do
  new_title = params["title"]
  if (new_title.length != 0)
    new_project = Project.new({:title => new_title, :id => nil})
    new_project.save()
  end
  @all_projects = Project.all
  erb(:projects_home)
end
######################


### CURRENT_PROJECT.ERB
patch('/project_rename/:proj_id') do
  proj_id = params['proj_id'].to_i
  proj_new_title = params['new_title']
  found_proj = Project.find_by_id(proj_id)
  found_proj.update({:title => proj_new_title})
  redirect("/projects/#{proj_id}")
end

delete('/delete_proj/:proj_id') do
  proj_id = params['proj_id'].to_i
  found_project = Project.find_by_id(proj_id)
  found_project.delete
  @all_projects = Project.all
  erb(:projects_home)
end

patch('/add_volunteers_to_project/:proj_id') do
  proj_id = params["proj_id"].to_i
  selected_vol_ids = params['vol_ids']
  selected_vol_ids.each do |vol_id|
    volunteer = Volunteer.find_by_id(vol_id.to_i)
    volunteer.update({:project_id => proj_id})
  end
  redirect("/projects/#{proj_id}")
end

delete('/remove_volunteers_from_project/:proj_id') do
  proj_id = params["proj_id"].to_i
  selected_vol_ids = params['vol_ids']
  selected_vol_ids.each do |vol_id|
    volunteer = Volunteer.find_by_id(vol_id.to_i)
    volunteer.update({:project_id => 0})
  end
  redirect("/projects/#{proj_id}")
end
###########################


### CURRENT_VOLUNTERR.ERB
patch('/volunteer_rename/:vol_id') do
  vol_id = params['vol_id'].to_i
  vol_new_name = params['new_name']
  found_vol = Volunteer.find_by_id(vol_id)
  found_vol.update({:name => vol_new_name})
  redirect("/volunteers/#{vol_id}")
end

post('/add_project_to_volunteer/:vol_id') do
  proj_id = params['proj_id'].to_i
  vol_id = params['vol_id'].to_i
  @found_proj = Project.find_by_id(proj_id)
  @found_volunteer = Volunteer.find_by_id(vol_id)
  DB.exec("UPDATE volunteers SET project_id = #{proj_id} WHERE id = #{vol_id};")
  erb(:project_assignment)
end

delete('/delete_vol/:vol_id') do
  vol_id = params['vol_id'].to_i
  found_volunteer = Volunteer.find_by_id(vol_id)
  found_volunteer.delete
  @all_volunteers = Volunteer.all
  erb(:volunteers_home)
end
##########################
