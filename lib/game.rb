# frozen_string_literal: true

class Game
  attr_reader :player1, :player2

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  def attack
    current_opponent.receive_damage
    @players.rotate!
  end

  def current_player
    @players.first
  end

  def current_opponent
    @players.last
  end

  def loser
    loser = @players.select { |p| p.hit_points <= 0 }
    loser.empty? ? nil : loser.first
  end

  private

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
  end
end