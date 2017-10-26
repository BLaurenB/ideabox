require 'rails_helper'

feature "When guest visits root" do
  scenario "they can log in" do
    user = User.create(username: "funbucket13", password: "Pass789")

    visit '/'
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, funbucket13!")
  end

  scenario "they can log out" do
    user = User.create(username: "funbucket13", password: "Pass789")

    visit '/ideas'
    click_on 'Logout'

    expect(current_path).to eq(root_path)
  end

end
