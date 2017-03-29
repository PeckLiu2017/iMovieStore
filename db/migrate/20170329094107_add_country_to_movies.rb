class AddCountryToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :country, :string
  end
end
