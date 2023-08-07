class Movie < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_one_attached :image
  belongs_to :genre

  
  def average_rating 
    ratings.average(:score)
  end
  def display_title
    title.upcase
  end
end
