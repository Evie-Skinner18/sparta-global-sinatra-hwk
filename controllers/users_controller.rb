require "sinatra"
require "sinatra/reloader"

#only camelCase thing in Ruby is class names
class UsersController < Sinatra::Base



  #$ sign sets up an ultra global variable. We need to make an array of hashes accessible from everywhere
    $users = [
      {
      id: 0,
      email: "nosugar4me@gmail.com",
      first_name: "Sue"
      last_name: "Skinner"
      age: 39

      },
      {
        id: 1,
        email: "realalewales@gmail.com",
        first_name: "Dave"
        last_name: "Jones"
        age: 58
      },
      {
        id: 2,
        email: "just-do-it@gmail.com",
        first_name: "Shia"
        last_name:"LaBoeuf"
        age: 31
      },
    ]
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
    "Hello world!"
  end



end #End of UsersController class
