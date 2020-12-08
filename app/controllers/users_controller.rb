class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show' #what is this
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect '/gifts'
    end
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
    user = User.find_by_email(pararms["email"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
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
