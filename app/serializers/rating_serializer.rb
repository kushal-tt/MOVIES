class RatingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :score, :review
end
