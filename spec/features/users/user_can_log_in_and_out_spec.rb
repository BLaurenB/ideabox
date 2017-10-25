# require "rails_helper"
#
#
# describe "Visitor creates new account" do
#   scenario "guest signs up to be new user" do
#     visit '/'
#     click_on "Create Account"
#     expect(current_path).to eq(new_user_path)
#
#     fill_in "user[username]", with: "Merrrmaid"
#     fill_in "password[password]", with: "abc123"
#
#     click_on "Create User"
#
#     expect(page).to have_content("Welcome, Merrrmaid!")
#     expect(page).to have_link("Log Out")
#
#     click_on "Log Out"
#     expect(current_path).to eq(root_path)
#   end
#
#   scenario "User can log in," do
#     user = User.create(username: "Merrrmaid", password: "abc123")
#
#     visit'/'
#     click_on "Log In"
#     expect(current_path).to eq(login_path)
#
#     fill_in "session[username]", with: user.username
#     fill_in "session[password]", with: user.password
#
#     click_on "Log In"
#
#     expect(page).to have_content("Welcome, Merrrmaid!")
#
#   end
#
#
# end
