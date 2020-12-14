class UsersController < ApplicationController

  get "/signup" do
    erb :"users/signup"
  end

  post "/signup" do
    user = User.new(params)
    if user.invalid?
      redirect "/signup"
    else
      user.save
      session[:user_id] = user.id
      redirect "/users"
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
      redirect "/users/login"
    end
  end

  get "/users" do
    need_login
    @users = User.all
    erb :"/users/index"
  end

  get "/users/:id" do
    need_login
    @user = User.find_by(id: params["id"]) 
    erb :"/users/show"
  end

  get "/logout" do
    session.clear
    flash[:message] = 'You have successfully logged out!'
    redirect "/"
  end


end
