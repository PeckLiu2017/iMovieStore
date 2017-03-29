class AddRunningTimeToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :running_time, :string
  end
end
