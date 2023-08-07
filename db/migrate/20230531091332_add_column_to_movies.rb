class AddColumnToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :image, :binary
  end
end
