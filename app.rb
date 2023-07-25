require "sinatra"
require "sinatra/reloader"

get("/") do
  
  erb(:square)
end

get("/square/new") do

  erb(:square)
end

get("/square/results") do
  
  erb(:square_results)
end

get("/square_root/new") do

  erb(:square)
end

get("/square_root/results") do
  
  erb(:square_results)
end
