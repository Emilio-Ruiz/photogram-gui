class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })

  end

  def show

    #Parameters: {"path_username" => "anisa"}

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    #if the_user == nil
    # redirect_to("/users")
    #else
    #render({:template => "user_templates/show.html.erb"})
    # end
    # end
    render({ :template => "user_templates/show.html.erb" })

    #redirect_to("users/<%= @the_user %>")
  end

  def create
    #{"path_username"=>"cristina"}

    input_user = params.fetch("input_username")

    a_new_user = User.new
    a_new_user.username = input_user
    a_new_user.save

    redirect_to("/users/#{a_new_user.username}")

    #render({:template => "user_templates/create.html.erb"})
  end

  def update
    # {"input_username"=>"anisa1", "controller"=>"users", "action"=>"update", "user_id"=>"117"}

    the_id = params.fetch("user_id")
    matching_users = User.where({ :id => the_id })
    the_user = matching_users.at(0)
    the_user.username = params.fetch("input_username")
    the_user.save

    redirect_to("/users/#{the_user.username}")
    # render({ :template => "user_templates/update.html.erb" })
  end

  def comment
    render({ :template => "user_templates/update.html.erb" })
  end
end
