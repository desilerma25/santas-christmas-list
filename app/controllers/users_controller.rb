class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(email: params["email"], username: params["username"], password: params["password"])
    if user.email.blank? || user.username.blank? || user.password.blank? || User.find_by_email(params["email"])
      redirect '/signup'
    else
      user.save
      session[:user_id] = user.id
      redirect '/gifts'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by_email(params["email"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect '/gifts'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end
