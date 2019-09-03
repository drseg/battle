require './spec/features/web_helpers'

feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Player 1 attacked Player 2'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).not_to have_content 'Player 2: 60HP'
    expect(page).to have_content 'Player 2: 50HP'
  end
end