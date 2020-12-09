class UsersController < ApplicationController

  get "/signup" do
    erb :"users/signup"
  end

  post "/signup" do
    user = User.new(params)
    if user.email.blank? || user.username.blank? || user.password.blank? || User.find_by_email(params["email"])
      redirect "/signup"
    else
      user.save
      session[:user_id] = user.id
      redirect "/users/index"
    end
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    user = User.find_by_email(params["email"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect "/users" 
    else
      redirect "/login"
    end
  end

  get "/users" do
    if !logged_in?
      redirect "/login"
    end
    @users = User.all
    erb :"/users/index"
  end

  get "/users/:id" do # get info on idv. user 
    if !logged_in?
      redirect "/login"
    end
    @user = User.find(params["id"]) 
    erb :"/users/show"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
