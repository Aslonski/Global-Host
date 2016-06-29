class UsersController < ApplicationController

  before_filter 'authorize!', :only => [:edit, :delete]

  def index
    $current = current_user
    @all_city_hosts = User.alternative_matches(current_user.id, params[:search])
    @users = User.search(params[:search])
  end

  def new
    @user = User.new
    @interests = Interest.all
  end

  def create
    @interests = Interest.all
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_search_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @interests = Interest.all
    @user = User.find(params[:id])
  end

  def update
    @interests = Interest.all
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render edit_user_path
    end
  end

  def create_interests
    @interests = Interest.all
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender, :is_host, :password, all_interests:[])
  end
end
