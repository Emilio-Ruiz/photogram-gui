class PhotosController < ApplicationController 

  def index 

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({:template => "photo_templates/index.html.erb"})
  end
  def show 
    # Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({:id => url_id })

    @the_photo = matching_photos.at(0)

    render({:template => "photo_templates/show.html.erb" })
  end 

  def baii 

     # Parameters: {"toast_id"=>"777"}

    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy
    
    #render({:template => "photo_templates/baii.html.erb" })

    redirect_to("/photos")
  end
  def create 

    #Parameters: {"query_image"=>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image 
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    #render({:template => "photo_templates/create.html.erb"})

    next_url = "/photos/" + a_new_photo.id.to_s

    redirect_to(next_url)
  end 
  def update

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")

    the_photo.save

    render({:template => "photo_templates/update.html.erb"})

    next_url = "/photos/#{the_photo.id}"

    redirect_to(next_url)
  end
  def comment 

    comment_id = params.fetch("modify_id")
    
    a_new_comment = Comment.new 
    a_new_comment.save 

    comment_url = "/photos/#{a_new_photo.id}"

    redirect_to(comment_url)

  end


  # Make a new action
  # Create a comment
  # Retrieve the values from the params hash, assign them
  # Save
  # Redirect to photo details page
end
