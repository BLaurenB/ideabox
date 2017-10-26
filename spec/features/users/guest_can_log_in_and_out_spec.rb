# require 'rails_helper'
#
# feature "When guest visits root" do
#   describe "they can log in" do
#     user = User.create(username: "funbucket13", password: "Pass789")
#
#     visit '/'
#     click_on "Log In"
#
#     expect(current_path).to eq(login_path)
#
#     fill_in "session[username]", with: user.username
#     fill_in "session[password]", with: user.password
#     click_on "Log In"
#
#     expect(current_path).to eq(user_path(user))
#     expect(page).to have_content("Welcome, funbucket13!")
#   end
#
#   scenario "they can log out" do
#     # visit '/'
#
#   end
#
# end
