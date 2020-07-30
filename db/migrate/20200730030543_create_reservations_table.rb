class CreateReservationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :users_id
      t.integer :movie_rights_id
      end
  end
end
