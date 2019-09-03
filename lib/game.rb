# frozen_string_literal: true

class Game
  attr_reader :player1, :player2

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  private

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
end