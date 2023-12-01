class UsersController < ApplicationController

  before_action :require_logged_in, only: [:show, :index]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end


end
