class GiftsController < ApplicationController

  get "/gifts" do # maybe remove if statement?
    need_login
    @gifts = Gift.all
    erb :"/gifts/index"
  end

  get "/gifts/new" do # form to create new gift
    need_login
    erb :"/gifts/new" # display view
  end

  get "/gifts/:id" do # get info on idv. gift 
    need_login
    @gift = Gift.find(params["id"]) 
    erb :"/gifts/show"
  end

  post "/gifts" do # posts new gift #changed to /gifts from /gifts/new 
    need_login
    gift = Gift.new(params)
    gift.user_id = session[:user_id]
    gift.save
    redirect "/gifts" #makes new get req.
  end
  
  get "/gifts/:id/edit" do # get form to edit indv. gift
    @gift = Gift.find(params["id"])
    unauthorized
    erb :"/gifts/edit"
  end

  
  patch "/gifts/:id" do # submit change to gift (edited)
    @gift = Gift.find(params["id"])
    unauthorized
    @gift.update(params)
    erb :"/gifts/#{@gift.id}" #redirects to indv. gift to show update 
  end

  
  delete "/gifts/:id" do # deletes a specific gift
    @gift = Gift.find(params["id"])
    unauthorized
    @gift.delete
    redirect "/gifts"
  end


  private

  def unauthorized
    if @gift.user != current_user
      redirect '/gifts'
    end
  end
   
  def need_login
    if !logged_in?
      redirect '/login'
    end
  end
  
end
