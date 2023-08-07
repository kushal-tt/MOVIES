class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :ratings, :rating_value, :score
  end
end
