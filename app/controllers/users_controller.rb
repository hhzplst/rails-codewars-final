class UsersController < ApplicationController


  def signup
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to coding_challenges_path
    else
      render :signup
    end
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        redirect_to coding_challenges_path
      else
        flash[:alert] = "username / password combination is invalid"
        redirect_to home_path
      end
    else
      flash[:alert] = "please enter username and password"
      redirect_to home_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:username,:password, :password_confirmation, :email)
  end

end
