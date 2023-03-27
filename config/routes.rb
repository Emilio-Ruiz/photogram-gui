Rails.application.routes.draw do

  get("/users", {:controller => "users", :action => "index"})
  get("/users/anisa", {:controller => "users", :action => ""})
end
