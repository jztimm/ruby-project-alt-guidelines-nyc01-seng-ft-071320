class UpdateNowPlayingTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :now_playings, :reservations
  end
end
