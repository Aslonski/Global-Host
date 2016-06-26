class UserInterestsController < ApplicationController
  def index
    @user_interests = UserInterest.search(params[:search])
  end

  def new
    @user = current_user
    @interests = UserInterest.all
    @user_interest = UserInterest.new
  end

  def create
    @user = current_user
    @interests = UserInterest.all
    @user_interest = UserInterest.new(user_interest_params)
    if @user_interest.save
      redirect_to user_path
    else
      @errors = @user_interest.errors.full_messages
    end
  end

  def show
    @user_interest = UserInterest.find(params[:id])
  end

  def update
    @user_interest = UserInterest.find(params[:id])
    if @user_interest.update(user_interest_params)
      redirect_to user_path
    else
      render edit_user_interest_path
    end
  end

  private
  def user_interests
    params.require(:user_interests).permit(:name)
  end
end
