class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  def login
  end

  def new

  end

  def create
    user = User.find_by(username: session_params[:username])
    user = create_user if user.nil?
    login(user)
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to login_path
  end

  private

  def login(user)
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def create_user
    @user = User.new(session_params)
    if @user.save
      @user
    else
      render "new"
    end
  end

  def logged_in_redirect
    if logged_in?
      flash[:error] = 'You are already logged in'
      redirect_to root_path
    end
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
