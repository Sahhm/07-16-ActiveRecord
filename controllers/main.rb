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
  b = Album.find(params["album_id"].to_i)
  b.photos << a
  
  erb :"add_photo"
end

get "/add_to_another_album_form" do
  
  erb :"add_to_another_album_form"
end

get "/add_to_another_album" do
  a = Photo.find(params["photo_id"].to_i)
  b = Album.find(params["album_id"].to_i)
  
  b.photos << a
  
  erb :"add_to_another_album"
end

get "/update_photo_form" do
  erb :"update_photo_form"
end

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
  
  
  
  
  
  
