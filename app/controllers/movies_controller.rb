class MoviesController < ApplicationController
 def index
  @movies = Movie.all
   @movies = @movies.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @movies = @movies.where(genre_id: params[:genre_id]) if params[:genre_id].present?
       @movies.empty? ? render(json:'No movies found' ) : render(json: MovieSerializer.new(@movies))
  end

  def show
  @movie = Movie.find_by(id: params[:id])
     if @movie
       render json: MovieSerializer.new(@movie)
     else
       render json: { error: 'Movie not found' }, status: :not_found
     end
   end
end


