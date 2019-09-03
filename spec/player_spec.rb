# frozen_string_literal: true

require './lib/player'

describe Player do
  subject(:player1) { Player.new('player1') }
  subject(:player2) { Player.new('player2') }

  describe '#name' do
    it 'returns the name' do
      expect(player1.name).to eq 'player1'
    end

    describe '#hit_points' do
      it 'returns the hit points' do
        expect(player1.hit_points).to eq described_class::DEFAULT_HIT_POINTS
      end
    end

    describe '#receive_damage' do
      it 'reduces the player hit points' do
        expect { player2.receive_damage }.to change { player2.hit_points }.by(-10)
      end
    end
  end
end