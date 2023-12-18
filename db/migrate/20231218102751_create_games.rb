class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :game_name
      t.integer :igdb_id
      t.date :release_date
      t.decimal :rating
      t.string :platform
      t.string :genre
      t.string :publisher
      t.string :developer
      t.datetime :created_at
      t.datetime :updated_at
      t.string :cover_url
      t.text :summary
      t.text :storyline
      t.json :screenshots
      t.json :videos
      t.json :websites
      t.boolean :multiplayer
      t.json :player_perspectives
      t.json :themes
      t.json :modes
      t.json :franchises
      t.json :similar_games
      t.decimal :total_rating
      t.integer :total_rating_count
      t.decimal :popularity
      t.decimal :aggregated_rating
      t.integer :aggregated_rating_count
      t.json :platforms

      t.timestamps
    end
  end
end
