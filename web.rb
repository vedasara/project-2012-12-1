require 'rubygems'
require 'bundler/setup'
require 'sinatra'


get '/'  do 
	"hello"
	#haml :index
end
