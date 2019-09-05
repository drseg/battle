# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/battle_rules'
require_relative './lib/player'

class Battle < Sinatra::Base
  get '/' do
    erb :index
  end

  before do
    @game = BattleRules.instance
  end

  post '/names' do
    BattleRules.create(Player.new(params['player_1_name']),
                       Player.new(params['player_2_name']))
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    @game.attack
    redirect @game.loser ? '/game-over' : '/attack-confirmation'
  end

  get '/attack-confirmation' do
    erb :attack
  end

  get '/game-over' do
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
