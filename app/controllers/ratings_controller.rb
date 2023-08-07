class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new(rating_params)
    @rating.movie = @movie
    @rating.user = current_user
    
    if @rating.save
      # redirect_to movies_path, notice: 'Rating done successfully.'   #http
      render json: {
        message:"movie rated successfully",                      #json
        rating:  RatingSerializer.new(@rating)
        }
    else
      # redirect_to movies_path(@movie), alert: 'Already rated the Movie.'   #http
      render json: {message:"Already rated the Movie"}                   #json
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score,:review, :user_id, :movie_id)
  end
end
