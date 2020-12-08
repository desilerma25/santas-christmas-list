class GiftsController < ApplicationController

  get "/gifts" do # maybe remove if statement?
    if logged_in?
      @gifts = Gift.all
      erb :"/gifts/index"
    else
      redirect '/login'
    end
  end

  get "/gifts/new" do # form to create new gift
    if !logged_in? # use !, bc if not logged in will redirect, which acts like a return
      redirect '/login'
    else
      erb :"/gifts/new"
    end
  end

  post "/gifts" do # posts new gift
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

  get "/gifts/:id" do # get info on idv. gift 
    if !logged_in?
      redirect '/login'
    end
      @gift = Gift.find(params["id"]) 
      erb :"/gifts/show"
  end

  
  get "/gifts/:id/edit" do # get form to edit indv. gift
    if !logged_in?
      redirect '/login'
    end
    @gift = Gift.find(params["id"])
    erb :"/gifts/edit"
  end

  
  patch "/gifts/:id" do # submit change to gift (edited)
    if !logged_in?
      redirect '/login'
    end
    @gift = Gift.find(params["id"])
    erb :"/gifts/:id"
  end

  
  delete "/gifts/:id/delete" do # deletes a specific gift
    if !logged_in?
      redirect '/login'
    end
    @gift = Gift.find(params["id"])
    redirect "/gifts"
  end
end
