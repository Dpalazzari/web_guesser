require 'pry'
require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(0..100)
get '/' do
  # binding.pry
  "The SECRET NUMBER is #{secret_number}"
end
