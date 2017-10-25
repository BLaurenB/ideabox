require 'rails_helper'

# describe "User visits New Idea page," do
#
#   scenario "they see h1 stating New Idea" do
#     category = create(:category)
#     visit new_category_idea_path(category)
#
#     expect(page).to have_content("New Idea")
#   end
#
#   scenario "they see a form to create a new idea" do
#     category = create(:category)
#     visit new_category_idea_path(category)
#
#     fill_in "idea[title]", with: "OMG!"
#     fill_in "idea[description]", with: "OMG...DESCR!"
#     select("Category Title 1", from: "idea[category_id]").select_option
#     # expect(page).to have_select("idea[category_id]", option_value = 1)
#
#     click_button "Create Idea"
#
#     expect(current_path).to eq(category_idea_path)
#   end
# 
#
# end
