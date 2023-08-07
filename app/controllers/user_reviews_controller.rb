class UserReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_reviews = current_user.ratings
    # render json: @user_reviews
  end

  def edit
    @rating = set_ratings
      # render json: RatingSerializer.new(@rating)
  end

  def update
    @rating = set_ratings
    if @rating.update(review_params)
      redirect_to user_reviews_path, notice: 'Review updated successfully.'
      #  render json:{
      #   message: "updated successfully",
      #   rating: RatingSerializer.new(@rating)
      # } 
      
    else
      render :edit
      # render json: {errors: "rating not found"}
x   end
  end

  def destroy
    @rating = set_ratings
    @rating.destroy
    redirect_to user_reviews_path, alert: 'Review deleted successfully.'
    # render json: {message:"review deleted successfully"}
  end

  private

  def review_params
    params.require(:rating).permit(:score, :review)
  end

  def set_ratings
     @rating = current_user.ratings.find(params[:id])
  end
end

