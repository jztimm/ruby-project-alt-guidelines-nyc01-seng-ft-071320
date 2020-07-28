class CreateNowPlayingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :now_playings do |t|
      t.integer :movies_id
      t.integer :movie_theaters_id
    end
  end
end
