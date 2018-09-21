class UsersController < ApplicationController

  get '/users/show' do
    @user = User.find_by(params[:id])
    erb :'users/show'
  end


  get '/signup' do
     if !logged_in?
       erb :'users/create_user'
     else
       redirect to '/tweets'
     end
   end

  post '/signup' do
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password_digest = params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect to '/tweets'
    else
      erb :'/signup'
    end
  end

  get '/login' do
    erb :'/login'
  end

  post '/login' do
    login(params[:email], params[:password])
    redirect '/tweets'
  end

  get '/logout' do
    logout!
    redirect '/tweets'
  end


end
