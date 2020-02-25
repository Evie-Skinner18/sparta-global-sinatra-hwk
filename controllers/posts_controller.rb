
require "sinatra"
require "sinatra/reloader"

#only camelCase thing in Ruby is class names
class PostsController < Sinatra::Base
  #telling Ruby to go to Sinatra and get a specific class from it called Base.
  #This new class we're making is going to inherit lots of stuff from the existing Sinatra class Base.
  #All th erequests for this Carl this controller can be made through this class PostsController.
  # So now we have set up Carl and he is listening but he can't send anything to Marius or Vivian yet.
  #Carl is now lsitening to pick up these seven different types of request

#$ sign sets up an ultra global variable. We need to make an array of hashes accessible from everywhere
  $posts = [
    {
    id: 0,
    title: "Post 1",
    body: "this is the first post"

    },
    {
      id: 1,
      title: "Post 2",
      body: "This is the second post!"
    },
    {
      id: 2,
      title: "Post 3",
      body: "This is the third post!"
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

  #SEVEN RESTFUL ROUTES
  #Set up a get request o this url which is the abslute beginning of the system. Like in the terminal relative file paths
  #start with a / it's the index.html. Like wikipedia's homepage

  #We make a get request to read information off the page. telling ERB the ERB file I want you to show is
  # called idex and it's inside the folder posts
  get "/" do
    @title = "Blog Posts"
    @posts = $posts
    erb :"posts/index"
  end

  get "/new" do
    "this is the new form"
  end

  #get request to edit the form
  get "/:id/edit" do
    id = params[:id]
    "this is the edit form for #{id}"
  end

  #put request to put data on the form
  put "/:id" do
    id = params[:id]
    "Update the pokemon with an id of: #{id}"
  end

  #delete request destroys something
  delete "/:id" do
    id = params[:id]
    "Destroy the pokemon with an id of #{id}"
  end

  #post request makes sth new
  post "/" do
    "Create a new pokemon"
  end

  #this sets a container called id and whatever you put in id's place
  #show request shows you some info
  get "/:id" do
    id = params[:id].to_i
    @post = $posts[id]



    erb :"posts/show"


    "show: #{$posts [id]}"
  end
end
