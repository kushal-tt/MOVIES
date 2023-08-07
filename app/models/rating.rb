class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, uniqueness: { scope: :movie_id, notice: "has already rated this movie." }
  validates :user_id, uniqueness: { scope: :movie_id, notice: "You can only give one review per rating." }

  validates :score, presence: true
end

