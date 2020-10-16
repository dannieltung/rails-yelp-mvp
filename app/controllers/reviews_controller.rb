class ReviewsController < ApplicationController
  before_action :find_restaurant, except: [:destroy, :edit, :update]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Thanks for your review!'
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), notice: 'Review deleted.'
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to restaurant_path(@review.restaurant), notice: 'Review updated!'
    else
      render :new
    end
  end


  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
