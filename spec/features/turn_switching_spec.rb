require './spec/features/web_helpers'

feature 'Turn switching' do
  context 'seeing the current turn' do
    scenario 'at the start of a new game' do
      sign_in_and_play
      expect(page).to have_content "Player 1's turn"
    end

    scenario 'after player 1 has attacked it switches turn' do
      sign_in_play_and_attack
      click_link 'OK'
      expect(page).not_to have_content "Player 1's turn"
      expect(page).to have_content "Player 2's turn"
    end
  end
end