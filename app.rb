require 'sinatra'
require 'rerun'
require 'mhartl_palindrome'

get '/' do
  erb :index
end

get '/palindrome' do
  @title = "Palindrome Detector"
  erb :palindrome
end

post '/check' do
  @phrase = params['phrase'] || ""
  erb :result
end

get '/about' do
  @title = "About This App"
  erb :about
end

