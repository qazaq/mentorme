require "rails_helper"

RSpec.feature "User siging in" do
  background do
    @user = create(:user)
  end
  scenario "succesfully" do
    sign_in @user

    expect(page).to have_content @user.email
  end

  scenario "unsuccesfully" do
    visit new_user_session_path
    fill_in "Email", with: "wrong email"
    fill_in "Password", with: "wrong password"
    click_on "Log in"

    expect(page).not_to have_content @user.email
  end
end
