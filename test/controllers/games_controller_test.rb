require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url, as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { aggregated_rating: @game.aggregated_rating, aggregated_rating_count: @game.aggregated_rating_count, cover_url: @game.cover_url, created_at: @game.created_at, developer: @game.developer, franchises: @game.franchises, game_name: @game.game_name, genre: @game.genre, igdb_id: @game.igdb_id, modes: @game.modes, multiplayer: @game.multiplayer, platform: @game.platform, platforms: @game.platforms, player_perspectives: @game.player_perspectives, popularity: @game.popularity, publisher: @game.publisher, rating: @game.rating, release_date: @game.release_date, screenshots: @game.screenshots, similar_games: @game.similar_games, storyline: @game.storyline, summary: @game.summary, themes: @game.themes, total_rating: @game.total_rating, total_rating_count: @game.total_rating_count, updated_at: @game.updated_at, videos: @game.videos, websites: @game.websites } }, as: :json
    end

    assert_response :created
  end

  test "should show game" do
    get game_url(@game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { aggregated_rating: @game.aggregated_rating, aggregated_rating_count: @game.aggregated_rating_count, cover_url: @game.cover_url, created_at: @game.created_at, developer: @game.developer, franchises: @game.franchises, game_name: @game.game_name, genre: @game.genre, igdb_id: @game.igdb_id, modes: @game.modes, multiplayer: @game.multiplayer, platform: @game.platform, platforms: @game.platforms, player_perspectives: @game.player_perspectives, popularity: @game.popularity, publisher: @game.publisher, rating: @game.rating, release_date: @game.release_date, screenshots: @game.screenshots, similar_games: @game.similar_games, storyline: @game.storyline, summary: @game.summary, themes: @game.themes, total_rating: @game.total_rating, total_rating_count: @game.total_rating_count, updated_at: @game.updated_at, videos: @game.videos, websites: @game.websites } }, as: :json
    assert_response :success
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game), as: :json
    end

    assert_response :no_content
  end
end
