require 'sinatra/base'

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
    @player1 = Game.instance.player1
    @player2 = Game.instance.player2
    erb :play
  end

  get '/attack' do
    @player1 = Game.instance.player1
    @player2 = Game.instance.player2
    @player1.attack(@player2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end