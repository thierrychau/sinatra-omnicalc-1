require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

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

  erb(:square_root)
end

get("/square_root/results") do
  
  erb(:square_root_results)
end

get("/payment/new") do

  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f / 100
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_i

  @number_periods = 12*@years
  @rate_per_period = @apr/12

  @payment = (@rate_per_period * @principal) / (1 - (1 + @rate_per_period)**(-@number_periods))

  erb(:payment_results)
end

get("/random/new") do

  erb(:random)
end

get("/random/results") do
  @minimum = params.fetch("minimum").to_f
  @maximum = params.fetch("maximum").to_f
  @random = rand(@minimum..@maximum)

  erb(:random_results)
end
