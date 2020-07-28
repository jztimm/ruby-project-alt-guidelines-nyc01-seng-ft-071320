class CreateMovieTheatersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_theaters do |t|
      t.string :name
      t.string :location
    end
  end
end
