require 'rails_helper'

feature "Admin level user visits page to edit category," do

  scenario "they see a heading called Edit Category (title)" do
    category = create(:category)
    idea = Idea.create(title: "This Idea!", description:"It's a good one", category_id: Category.last.id)

    visit edit_category_path(category)

    within(:css, "h1") do
      expect(page).to have_content("Edit")
    end
  end

    scenario "they fill in the form to edit the category," do
      category = create(:category)
      idea = Idea.create(title: "This Idea!", description:"It's a good one", category_id: Category.last.id)

      visit edit_category_path(category)

      fill_in "category[title]", with: "I Edited This!"
      click_on "Update Category"

      category = Category.last

      expect(current_path).to eq(category_path(category))
      expect(page).to have_content("I Edited This!")
    end

  end
