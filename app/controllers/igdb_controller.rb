require 'httparty'
class IgdbController < ApplicationController
    def authenticate
        if !session[:expires_at] || session[:expires_at] < Time.now
            response = HTTParty.post('https://id.twitch.tv/oauth2/token', 
                query: { 
                    client_id: ENV['IGDB_CLIENT_ID'], 
                    client_secret: ENV['IGDB_CLIENT_SECRET'], 
                    grant_type: 'client_credentials' 
                }
            )
            if response.success?
                session[:access_token] = response['access_token']
                session[:expires_in] = Time.now + response['expires_in'].to_i.seconds
                # render json: { token: response['access_token'] }
            else
                return response
            end
        end
        return session[:access_token]
    end
    
    def add_games
        token = authenticate
        headers = {
            'Client-ID': ENV['IGDB_CLIENT_ID'],
            "Authorization": "Bearer #{token}"
        }

        body = 'fields name; where name ~ *"Grand Theft Auto"*; limit 500;'
        response = HTTParty.post('https://api.igdb.com/v4/games', headers: headers, body: body)
        

        if response.success?
            games = JSON.parse(response.body)
            games.each do |game|
                # if Game.exists?(igdb_id: game['id'])
                    # Game.create(
                    #     name: game['name'],
                    #     igdb_id: game['id'],
                    #     release_date: game['release_dates'],
                    #     rating: game['rating'],
                    #     platform: game['platforms'],
                    #     genre: game['genres'],
                    #     publisher: game['publishers'],
                    #     developer: game['developers'],
                    #     cover_url: game['cover'],
                    #     summary: game['summary'],
                    #     storyline: game['storyline'],
                    #     screenshots: game['screenshots'],
                    #     videos: game['videos'],
                    #     websites: game['websites'],
                    #     multiplayer: game['multiplayer_modes'],
                    #     player_perspectives: game['player_perspectives'],
                    #     themes: game['themes'],
                    #     modes: game['game_modes'],
                    #     franchises: game['franchises'],
                    #     similar_games: game['similar_games'],
                    #     total_rating: game['total_rating'],
                    #     total_rating_count: game['total_rating_count'],
                    #     popularity: game['popularity'],
                    #     aggregated_rating: game['aggregated_rating'],
                    #     aggregated_rating_count: game['aggregated_rating_count'],
                    #     platforms: game['platforms']
                    # )
                # else
                #     existing_game = Game.find_by(igdb_id: game['id'])
                #     existing_game.update(
                #         name: game['name'],
                #         igdb_id: game['id'],
                #         release_date: game['release_dates'],
                #         rating: game['rating'],
                #         platform: game['platforms'],
                #         genre: game['genres'],
                #         publisher: game['publishers'],
                #         developer: game['developers'],
                #         cover_url: game['cover'],
                #         summary: game['summary'],
                #         storyline: game['storyline'],
                #         screenshots: game['screenshots'],
                #         videos: game['videos'],
                #         websites: game['websites'],
                #         multiplayer: game['multiplayer_modes'],
                #         player_perspectives: game['player_perspectives'],
                #         themes: game['themes'],
                #         modes: game['game_modes'],
                #         franchises: game['franchises'],
                #         similar_games: game['similar_games'],
                #         total_rating: game['total_rating'],
                #         total_rating_count: game['total_rating_count'],
                #         popularity: game['popularity'],
                #         aggregated_rating: game['aggregated_rating'],
                #         aggregated_rating_count: game['aggregated_rating_count'],
                #         platforms: game['platforms']
                #     )
                # end
            end
            render json: games
        else
            render json: response
        end
    end

    def search_game
        token = authenticate

        search_term = params[:search_term]

        headers = {
            'Client-ID': ENV['IGDB_CLIENT_ID'],
            'Authorization': "Bearer #{token}"
        }

        # search by name and limit to 500 results without dlc
        body = "fields name, cover.image_id, platforms.abbreviation; where name ~ *\"#{search_term}\"* | alternative_names.name ~ *\"#{search_term}\"* & parent_game = null; limit 500; sort rating desc;"
        response = HTTParty.post('https://api.igdb.com/v4/games', headers: headers, body: body)

        if response.success?
            games = JSON.parse(response.body)
            render json: games
        else
            render json: response.body
        end
    end
    
    # get game by igdb_id
    def get_game
        token = authenticate

        igdb_id = params[:igdb_id]

        headers = {
            'Client-ID': ENV['IGDB_CLIENT_ID'],
            'Authorization': "Bearer #{token}"
        }

        body = "fields name, cover.image_id, platforms.name, genres.name, first_release_date, rating, summary, storyline, screenshots.image_id, player_perspectives.name, themes.name, game_modes.name, franchises.name, franchise.games, similar_games, aggregated_rating, platforms.name; where id = #{igdb_id};"
        response = HTTParty.post('https://api.igdb.com/v4/games', headers: headers, body: body)

        if response.success?
            game = JSON.parse(response.body)
            render json: game
        else
            render json: response.body
        end
        
    end

end
