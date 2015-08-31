require 'rails_helper'

feature 'User sign in', %q{
  In order to get answer from community
  As an Authenticated user
  I want to be able to question
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user created question' do
    sign_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'TestTitle'
    fill_in 'Body', with: 'TestBody'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created.'
  end

  scenario 'Non-Authenticated user created question' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end