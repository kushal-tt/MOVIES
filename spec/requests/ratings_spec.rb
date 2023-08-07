require 'rails_helper'

RSpec.describe RatingsController, type: :request do

  let(:user) { create(:user) }
  let(:movie) { create(:movie) }

  describe 'POST #create' do
      context 'with valid parameters' do

        let(:valid_params) do
          {
            rating: attributes_for(:rating, user_id: user.id,movie_id: movie.id)
          }
        end

        it 'creates a new rating' do
            post "/movies/#{movie.id}/ratings", params: valid_params
          expect(response.status).to eq(200)
        end

        it 'associates the rating with the movie and current user' do
          post "/movies/#{movie.id}/ratings", params: valid_params
          rating = Rating.last
          expect(rating.movie).to eq(movie)
          expect(rating.user).to eq(user)
        end

        it 'renders JSON response with success message and rating details' do
          post "/movies/#{movie.id}/ratings", params: valid_params
          expect(response).to have_http_status(:success)
          json_response = JSON.parse(response.body)
          expect(json_response['message']).to eq('movie rated successfully')
          expect(json_response['rating']).to be_present
        end
     end
  end

end



