# frozen_string_literal: true

class Player
  attr_reader :name, :hit_points

  DEFAULT_HIT_POINTS = 60
  DEFAULT_DAMAGE = 10

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HIT_POINTS
  end

  def receive_damage
    @hit_points -= DEFAULT_DAMAGE
  end

  def ==(other)
    other.class == self.class && other.state == state
  end

  protected

  def state
    instance_variables.map { |variable| instance_variable_get variable }
  end
end