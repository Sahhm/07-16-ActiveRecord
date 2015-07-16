get "/homepage" do
  erb :"homepage"
end

get "/all_photos" do
  erb :"all_photos"
end

get "/add_photo_form" do
  erb :"add_photo_form"
end

get "/add_photo" do
  a = Photo.create(title: params["title"], location: params["location"], date: params["date"].to_i, url: params["url"], photographer_id: params["photographer_id"].to_i)
  b = Album.find(params["album_id"])
  b.photos << a
  
  erb :"add_photo"
end

get "/add_to_another_album_form" do
  
  erb :"add_to_another_album_form"
end

get "/add_to_another_album" do
  a = Photo.find(params["photo_id"])
  b = Album.find(params["album_id"])
  
  b.photos << a
  
  erb :"add_to_another_album"
end