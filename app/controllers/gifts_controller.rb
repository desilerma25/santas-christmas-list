class GiftsController < ApplicationController

  # GET: /gifts
  get "/gifts" do
    if logged_in?
      @gifts = Gift.all
      erb :"/gifts/index"
    else
      redirect '/login'
    end
  end

  # GET: /gifts/new
  get "/gifts/new" do
    if logged_in?
      erb :"/gifts/new"
    end
  end

  # POST: /gifts
  post "/gifts" do
    if logged_in?
      redirect "/gifts"
    end
  end

  # GET: /gifts/5
  get "/gifts/:id" do
    if logged_in?
      erb :"/gifts/show.html"
    end
  end

  # GET: /gifts/5/edit
  get "/gifts/:id/edit" do
    if logged_in?
      erb :"/gifts/edit.html"
  
    end
  end

  # PATCH: /gifts/5
  patch "/gifts/:id" do
    if logged_in?
      redirect "/gifts/:id"
    end
  end

  # DELETE: /gifts/5/delete
  delete "/gifts/:id/delete" do
    if logged_in?
      redirect "/gifts"
    end
  end
end
