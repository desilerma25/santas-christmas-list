class UsersController < ApplicationController

  get '/signup' do
    # directs to signup form
    erb :'/users/signup'
  end

  post '/signup' do
    # allows completed form to be submitted
    user = User.new(email: params[:email], username: params[:username] password: params[:password])
    if user.email.blank? || user.password.blank? || user.username.blank? || User.find_by_email(params[:email])
      redirect :/signup
    else
      user.save
      session[:user_id] = user.id
      redirect '/gifts'
    end
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by_email(pararms[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
