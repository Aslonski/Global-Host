class UsersController < ApplicationController

  before_filter 'authorize', :only => [:edit, :delete]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state_province, :country, :personal_info, :language, :gender, :is_host, :password)
  end
end
