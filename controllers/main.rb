get "/homepage" do
  erb :"homepage"
end

#shows all photos by title, photographer, date, and location
get "/all_photos" do
  erb :"all_photos"
end

#gives user option to add photo
get "/add_photo_form" do
  erb :"add_photo_form"
end

#does the ruby to add photo after add_photo_form gets inputs
get "/add_photo" do
  a = Photo.create(title: params["title"], location: params["location"], date: params["date"].to_i, url: params["url"], photographer_id: params["photographer_id"].to_i)
  b = Album.find(params["album_id"].to_i)
  b.photos << a
  
  erb :"add_photo"
end

#lets user add photos to a second/third/etc album
get "/add_to_another_album_form" do
  
  erb :"add_to_another_album_form"
end

#does the ruby to add the photo selected to the album selected
get "/add_to_another_album" do
  a = Photo.find(params["photo_id"].to_i)
  b = Album.find(params["album_id"].to_i)
  
  b.photos << a
  
  erb :"add_to_another_album"
end

#gets input from user for updating the photo table's fields
get "/update_photo_form" do
  erb :"update_photo_form"
end

#runs if statements on each field to update the field if the user input something
get "/update_photo" do
  a = Photo.find(params["photo_id"].to_i)
  if params["title"] != ""
    a.update(title: params["title"])
  end
  if params["location"] != ""
    a.update(location: params["location"])
  end
  if params["date"] != ""
    a.update(date: params["date"].to_i)
  end
  if params["url"] != ""
    a.update(url: params["url"])
  end
  if params["photographer_id"] != ""
    a.update(photographer_id: params["photographer_id"].to_i)
  end
  a.save
  erb :"update_photo"
end
  
#form to get inputs for a new album
get "/add_album_form" do
  erb :"add_album_form"
end

#does the ruby to create a new album with given inputs
get "/add_album" do
  Album.create(subject: params["subject"])
  erb :"add_album"
end

#form to get inputs for a new photographer
get "/add_photographer_form" do
  erb :"add_photographer_form"
end

#does ruby to take inputs and create new photographer
get "/add_photographer" do
  Photographer.create(name: params["name"], hometown: params["hometown"])
  erb :"add_photographer"
end

#asks user which photo to delete 
get "/delete_photo_form" do
  erb :"delete_photo_form"
end

#deletes photo that the user clicks on
get "/delete_photo/:x" do
  a = Photo.find(params["x"])
  a.delete
  erb :"delete_photo"
end

#asks user which photographer to delete 
get "/delete_photographer_form" do
  erb :"delete_photographer_form"
end

#shows user list of photos that will be deleted along with photographer
get "/delete_photographer" do
  @b = params["photographer_id"]
  erb :"delete_photographer"
end  

#confirmation of delete
get "/confirm_delete" do
  u = Photographer.find(params["photographer_id"])
  u.photos.destroy_all
  u.delete
  erb :"homepage"
end

#asks user which album they would like to delete
get "/delete_album_form" do
  erb :"delete_album_form"
end

#does ruby that deletes selected album
get "/delete_album" do
 a = Album.find(params["album_id"])
 a.delete
 erb :"delete_album"
end
