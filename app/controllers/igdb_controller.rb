require 'httparty'
class IgdbController < ApplicationController
    def authenticate
        response = HTTParty.post('https://id.twitch.tv/oauth2/token', 
            query: { 
                client_id: ENV['IGDB_CLIENT_ID'], 
                client_secret: ENV['IGDB_CLIENT_SECRET'], 
                grant_type: 'client_credentials' 
            }
        )

        if response.success?
            @access_token = response['access_token']
            render json: response
        else
            render json: { error: response }, status: :unauthorized
        end
    end
end
