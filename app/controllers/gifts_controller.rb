class GiftsController < ApplicationController

  # GET: /gifts
  get "/gifts" do
    erb :"/gifts/index.html"
  end

  # GET: /gifts/new
  get "/gifts/new" do
    erb :"/gifts/new.html"
  end

  # POST: /gifts
  post "/gifts" do
    redirect "/gifts"
  end

  # GET: /gifts/5
  get "/gifts/:id" do
    erb :"/gifts/show.html"
  end

  # GET: /gifts/5/edit
  get "/gifts/:id/edit" do
    erb :"/gifts/edit.html"
  end

  # PATCH: /gifts/5
  patch "/gifts/:id" do
    redirect "/gifts/:id"
  end

  # DELETE: /gifts/5/delete
  delete "/gifts/:id/delete" do
    redirect "/gifts"
  end
end
