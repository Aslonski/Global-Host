class UsersController < ApplicationController

  before_filter 'authorize', :only => [:edit, :delete]

  def index
      $current = current_user
      @users = User.search(params[:search])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render edit_user_path
    end
  end


  private

  def user_params
    params.permit(:first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender, :is_host, :password)
  end
end
