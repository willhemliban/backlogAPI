class RenameGameNameInGames < ActiveRecord::Migration[7.1]
  def change
    rename_column :games, :game_name, :name
  end
end
