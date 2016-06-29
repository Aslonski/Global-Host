class ReviewsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @interests = Interest.all
  end

  def create
    @user = User.find(params[:user_id])
    @interests = Interest.all
    if @User.save
      redirect_to(@user)
    else
      @errors = @interest.errors.full_messages
      render 'new'
    end
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

  private
  def interest_params
    params.require(:user).permit(:all_interests, :about_me)
  end
end
