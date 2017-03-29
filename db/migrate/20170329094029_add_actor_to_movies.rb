class AddActorToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :actor, :string
  end
end
