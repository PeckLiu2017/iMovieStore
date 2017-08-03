class AddReleaseDateToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :release_date, :date
    add_column :movies, :test1, :string
    add_column :movies, :test2, :string
  end
end
