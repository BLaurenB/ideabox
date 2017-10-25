require 'rails_helper'

describe "Guest visits Idea Box," do
  scenario "they see a welcome page at the root" do
    visit '/'

    expect(page).to have_content("Welcome")
    expect(page).to have_content("Login")
    expect(page).to have_content("Create a New User Account")
  end

  scenario "they create a new account" do
    visit '/'
    click_on "Create a New User Account"
    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "funbucket13"
    fill_in "user[password]", with: "Pass789"

    click_on "Create User"
    expect(current_path).to eq(user_show_path)
    expect(page).to have_content("Welcome, funbucket13!")
  end

end
