class AddMovieTypeToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :movie_type, :string
  end
end
