require 'rails_helper'

RSpec.describe MoviesController, type: :request do
  MOVIES_URL="/movies"
  describe 'GET #index' do

    it "gives all movies" do
      get MOVIES_URL
       expect(response.status).to eq(200)
    end

    context 'when movies exist' do
      let!(:movie) { create(:movie) }

      it 'returns a list of movies' do
        get MOVIES_URL
        expect(response.status).to eq(200)
        # expect(response.body).to include(movie.title)
      end

    end

    context 'when no movies exist' do
      it 'returns "No movies found" message' do
        get MOVIES_URL
        expect(response.body).to include('No movies found')
      end
    end

    context 'when movies exist after search' do
      it "filters movie by title" do 
        get MOVIES_URL ,params:{search: 'Avengers'}
        expect(assigns(:movies).to_sql).to include("title LIKE '%Avengers%'")
      end
    end

    context 'when no movies  exist after search' do
      it "returns no movies when no match found" do
       get MOVIES_URL, params: { search: 'Germans' }
       expect(assigns(:movies)).to be_empty
      end
    end


    context 'when  movies  exist based on genre' do
      it "sorts movie by genre id" do
        genre=Genre.create(name: "action")
        movie1=Movie.create(title: "Movie 1", genre_id: genre.id)
        get MOVIES_URL, params: { genre_id: genre.id }
        expect(assigns(:movies)).to include(movie1)
      end
    end
  end

  describe "GET #show" do
    it "displays movie based on id" do
      movie = Movie.create(title: "Movie 1", description: "Description" )
      get "/movies/#{movie.id}"
      expect(response.status).to eq(200)
    end

    it "returns an error for an invalid movie id" do
      get "/movies/invalid_id"
      expect(response.status).to eq(404)
    end
  end

end

