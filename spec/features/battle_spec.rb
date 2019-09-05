require './lib/battle_rules'

describe 'Battle' do
  include Rack::Test::Methods

  def app
    Battle
  end

  let(:player1)      { Player.new('player1') }
  let(:player2)      { Player.new('player2') }
  let(:battle_rules) { BattleRules.instance }

  def expect_redirect_to(path)
    expect(last_response.redirect?).to be true
    follow_redirect!
    expect(last_request.path).to eq path
  end

  describe '#names'do
    def post_names(player1, player2)
      post '/names', player_1_name: player1.name,
                     player_2_name: player2.name
    end

    it 'creates a BattleRules instance with player names' do
      post_names(player1, player2)
      expect(battle_rules.player1).to eq player1
      expect(battle_rules.player2).to eq player2
    end

    it 'replaces previous BattleRules instance' do
      post_names(player1, player2)
      post_names(player2, player1)

      expect(battle_rules.player1).to eq player2
      expect(battle_rules.player2).to eq player1
    end

    it 'redirects to play' do
      post '/names'
      expect_redirect_to '/play'
    end
  end

  describe '#attack' do
    before :each do
      BattleRules.create(player1, player2)
    end

    it 'attacks the opponent' do
      player1_hp = player1.hit_points
      player2_hp = player2.hit_points

      post '/attack'
      expect(battle_rules.player2.hit_points).to be < player2_hp
      expect(battle_rules.player1.hit_points).to eq player1_hp
    end

    it 'switches current player and opponent after attack' do
      post '/attack'
      expect(battle_rules.current_player).to be player2
      expect(battle_rules.current_opponent).to be player1
    end

    it 'redirects to /attack-confirmation if game in progress' do
      post '/attack'
      expect_redirect_to '/attack-confirmation'
    end

    it 'redirects to /game-over if game over' do
      11.times { post '/attack' }
      expect_redirect_to '/game-over'
    end
  end
end