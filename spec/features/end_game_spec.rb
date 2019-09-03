# frozen_string_literal: true

require './spec/features/web_helpers'

feature 'End game' do
  def win_for_player_1
    sign_in_play_and_attack
    10.times { click_link 'OK'; click_button 'Attack' }
  end

  scenario 'Player 2 reaches 0 hit points' do
    win_for_player_1
    expect(page).to have_content 'Player 2 loses!'
  end
end
