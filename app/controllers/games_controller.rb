class GamesController < ApplicationController
  before_action :set_game, only: %i[ show update destroy ]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:game_name, :igdb_id, :release_date, :rating, :platform, :genre, :publisher, :developer, :created_at, :updated_at, :cover_url, :summary, :storyline, :screenshots, :videos, :websites, :multiplayer, :player_perspectives, :themes, :modes, :franchises, :similar_games, :total_rating, :total_rating_count, :popularity, :aggregated_rating, :aggregated_rating_count, :platforms)
    end
end
