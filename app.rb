require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/new_project') do
  erb(:new_project)
end

post('/new_volunteer') do
  erb(:new_volunteer)
end
