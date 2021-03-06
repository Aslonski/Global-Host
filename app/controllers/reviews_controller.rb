class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @reviews = Review.all.where(reviewee_id: @user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.create(review_params)
    if @review.save
      redirect_to(@user)
    else
      @errors = @review.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @reviews = Review.all.where(reviewee_id: @user.id)
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :score, :reviewee_id, :reviewer_id)
  end
end
