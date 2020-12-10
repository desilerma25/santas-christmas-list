class GiftsController < ApplicationController

  get "/gifts/new" do
    need_login
    erb :"/gifts/new"
  end

  get "/gifts/:id" do
    need_login
    @gift = Gift.find(params["id"]) 
    erb :"/gifts/show"
  end

  post "/gifts" do
    need_login
    gift = Gift.new(params)
    if gift.title.blank? || gift.description.blank?
      redirect "/gifts/new"
    end
      gift.user_id = session[:user_id]
      gift.save
      redirect "/gifts/#{gift.id}"
  end
  
  get "/gifts/:id/edit" do
    @gift = Gift.find(params["id"])
    unauthorized
    erb :"/gifts/edit"
  end

  
  put "/gifts/:id" do
    @gift = Gift.find(params["id"])
    unauthorized
    @gift.update(description: params["gift"]["description"])
    redirect "/gifts/#{@gift.id}"
  end

  
  delete "/gifts/:id" do
    @gift = Gift.find(params["id"])
    @user = @gift.user_id
    unauthorized
    @gift.delete
    redirect "/users/#{@user}"
  end


  private

  def unauthorized
    if @gift.user != current_user
      redirect "/gifts"
    end
  end
  
end
