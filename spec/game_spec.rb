require './lib/game'

describe Game do
  let(:player1) { double('Player', name: 'player 1') }
  let(:player2) { double('Player', name: 'player 2') }
  subject { Game.create(player1, player2) }

  it 'should be a singleton instance' do
    expect(Game.create(player1, player2)).to eq Game.instance
  end

  it 'should have two players' do
    expect(subject.player1).to eq player1
    expect(subject.player2).to eq player2
  end

  it 'should start with player 1' do
    expect(subject.current_player).to eq player1
  end

  it 'should start with player 2 as opponent' do
    expect(subject.current_opponent).to eq player2
  end

  describe '#attack' do
    it 'damages the opponent' do
      expect(player2).to receive(:receive_damage)
      subject.attack
    end

    it 'switches the current player' do
      allow(player2).to receive(:receive_damage)
      subject.attack
      expect(subject.current_player).to be player2
      expect(subject.current_opponent).to be player1
    end
  end
end