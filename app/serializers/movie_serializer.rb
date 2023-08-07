class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :release_date

    attribute :image_url do |movie|
      if movie.image.present?
        host = Rails.env.development? ? 'http://localhost:3000' : ENV["BASE_URL"]
        host + Rails.application.routes.url_helpers.rails_blob_url(movie.image, only_path: true)
      end
    end
end
