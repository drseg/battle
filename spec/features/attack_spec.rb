require './spec/features/web_helpers'

feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_play_and_attack
    expect(page).to have_content 'Player 1 attacked Player 2'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_play_and_attack
    expect(page).not_to have_content 'Player 2: 60 HP'
    expect(page).to have_content 'Player 2: 50 HP'
  end
end