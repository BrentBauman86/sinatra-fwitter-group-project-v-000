require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shushy_shush"
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    # def login(username, password)
    #   user = User.find_by(params[:username])
    #   if user && user.authenticate(params[:password])
    #     session[:user_id] = user.id
    #     redirect to '/tweets'
    #   else
    #     redirect to '/signup'
    #   end
    # end
  end
end

# get '/login' do
#   erb :"sessions/login"
# end
#
# post '/sessions' do
#   login(params[:email], params[:password])
#   redirect '/tweets'
# end
#
# get '/logout' do
#   logout!
#   redirect '/tweets'
# end
#
# end
