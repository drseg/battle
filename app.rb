require 'sinatra/base'
require_relative './lib/game'
require_relative './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    Game.create(Player.new(params['player_1_name']),
                Player.new(params['player_2_name']))
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  get '/attack' do
    @game = Game.instance
    @game.attack(@game.player2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end