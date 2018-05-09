#only camelCase thing in Ruby is class names
class UsersController < Sinatra::Base

  #Need to tell ERB to look for VIews (vivian) somewhere else not in this directory.
  # sets root as the parent-directory of the current file
    set :root, File.join(File.dirname(__FILE__), '..')

    # sets the view directory correctly
    set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end


# require "sinatra"

  get "/" do
    "<h1> Hello world! </h1>"
  end



end #End of UsersController class
