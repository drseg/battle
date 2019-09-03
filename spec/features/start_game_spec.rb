# frozen_string_literal: true

require './spec/features/web_helpers'

feature 'Starting the game' do
  scenario 'can enter two player names and see them afterwards' do
    sign_in_and_play
    expect(page).to have_content 'Player 1 vs. Player 2'
  end
end