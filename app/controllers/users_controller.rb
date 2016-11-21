class UsersController < ApplicationController
  skip_before_action :require_login
  def index
    if session[:login]
      redirect_to '/songs'
    else
      render 'users/index'
    end
  end
  def signin
    render 'users/login'
  end
  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:login] = user.id
      redirect_to "/songs"
    else
      flash[:error] = "Password or username invalid"
      redirect_to '/main'
    end
  end
  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:login] = user.id
      redirect_to "/songs"
    else
      flash[:error] = user.errors.full_messages
      redirect_to '/main'
    end
  end
  def logout
    session[:login] = false
    redirect_to '/main'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
