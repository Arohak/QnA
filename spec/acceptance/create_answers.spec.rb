require 'rails_helper'

feature 'User answere', %q{
  In order exchange knowlendge
  As an Authenticated user
  I want to be able to create answeres
} do

  given(:user) { create(:user) }
  given(:question) { create(:question) }

  scenario 'Authenticated user created answer', js: true do
    sign_in(user)
    visit question_path(question)

    fill_in 'Your answer', with: 'My answer'
    click_on 'Create'

    expect(current_path).to eq question_path(question)
    within '.answers' do
      expect(page).to have_content 'My answer'
    end
  end
end