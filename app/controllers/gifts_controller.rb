class GiftsController < ApplicationController

  get "/gifts" do # maybe remove if statement?
    if logged_in?
      @gifts = Gift.all
      erb :"/gifts/index"
    else
      redirect '/login'
    end
  end

  get "/gifts/new" do
    if !logged_in? # use !, bc if not logged in will redirect, which acts like a return
      redirect '/login'
    else
      erb :"/gifts/new"
    end
  end

  post "/gifts" do
    if !logged_in?
      redirect '/login'
    end
    gift = Gift.new(params)
    # gift = current_user.gifts.build(params) # only use if you understand build, recommended
    gift.user_id = session[:user_id] # recommended 
    gift.save
    redirect "/gifts"
    end
  end

  get "/gifts/:id" do
    if logged_in?
      @gift = Gift.find(params["id"]) 
      erb :"/gifts/show"
    else
      redirect '/login'
    end
  end

  # GET: /gifts/5/edit
  get "/gifts/:id/edit" do
    if logged_in?
      @gift = Gift.find(params["id"])
      erb :"/gifts/edit"
  
    end
  end

  # PATCH: /gifts/5
  patch "/gifts/:id" do
    if logged_in?
      @gift = Gift.find(params["id"])
      redirect "/gifts/:id"
    end
  end

  # DELETE: /gifts/5/delete
  delete "/gifts/:id/delete" do
    if logged_in?
      @gift = Gift.find(params["id"])
      redirect "/gifts"
    end
  end
end
