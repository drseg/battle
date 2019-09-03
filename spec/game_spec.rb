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
end