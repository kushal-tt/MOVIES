class AddReviewToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :review, :text
  end
end
