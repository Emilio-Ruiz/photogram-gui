class UsersController < ApplicationController 
  def index 
    matching_users = User.all 
   @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end
  def show 

    #Parameters: {"path_username" => "anisa"}

   url_username = params.fetch("path_username")


    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    #if the_user == nil 
    #  redirect_to("/")
    #else 
      #render({:template => "user_templates/show.html.erb"})

   # end
    render({:template => "user_templates/show.html.erb"})
  end
  def update
    input_user = params.fetch("username")

  end
  def create 
    #{"path_username"=>"cristina"}

  input_user = params.fetch("input_username")

    a_new_user = User.new
    a_new_user.username = input_user 
    a_new_user.save


    render({:template => "user_templates/create.html.erb"})
  end
end
