class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
  end
  
  def dashboard
    @user = current_user
  end

end
