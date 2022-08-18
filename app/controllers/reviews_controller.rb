require 'pry-byebug'

class ReviewsController < ApplicationController

  before_action :set_review, only: [:show]

  # def index
  #   @reviews = Reviews.all
  # end

  # def show
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      # binding.pry
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   @review.update(review_params)
  #   @review.save!
  #   redirect_to review_path(@review)
  # end

  # def destroy
  #   @review.destroy
  #   redirect_to reviews_path, status: :see_other
  # end

  private


  def set_review
    @review = review.find (params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
