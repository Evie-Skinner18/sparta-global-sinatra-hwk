require "sinatra"
require "sinatra/reloader" if development?

#Link this file with the Ruby file that has the class in
require_relative "controllers/posts_controller.rb"
run PostsController
