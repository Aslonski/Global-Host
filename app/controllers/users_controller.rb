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
    @user = User.new(user_params_registration_form)
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
  # @advisor - .require does not work with materialize form
  def user_params_registration_form
    params.permit(:first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender, :is_host, :password)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender, :is_host, :password)
  end
end
