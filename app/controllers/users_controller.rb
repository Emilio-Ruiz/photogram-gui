class UsersController < ApplicationController
  def index 
    @matching_users = User.all 

    @list_of_users = @matching_users.order({:username => :asc })
    
    render({:template => "user_templates/index.html.erb"})

  end

  def show 
    #Parameters:{"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({:username => url_username})

    @the_user = matching_usernames.first

    render({:template => "user_templates/show.html.erb"})
  
  end
  def create

    username_create = params.fetch("user_name")

    u = User.new 
    u.username = username_create
    u.private = false 
    u.comments_count = 0 
    u.likes_count = 0 
    u.save 

    #render({:template => "user_templates/index.html.erb"})

    redirect_to("/users/#{u.username}")
  end

  def update 
    
    user_update = params.fetch("modify_username")
    u=User.where({:username => user_update}).first 
    new_username = params.fetch("new_username")
    u.username=new_username
    u.save

    redirect_to("/users/#{u.username}")
  end
  
end
