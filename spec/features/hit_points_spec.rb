# frozen_string_literal: true

require './spec/features/web_helpers'

feature 'Viewing hit points' do
  scenario "can view player 2's hitpoints" do
    sign_in_and_play
    expect(page).to have_content 'Player 2: 60 HP'
  end
end