require 'rails_helper'

feature "Admin user visits a category show page," do
  scenario "they see links for editing, deleting, and returning to index" do

    category = create(:category)
    idea = Idea.create(title: "This Idea!", description:"It's a good one", category_id: Category.last.id)

    visit admin_category_path(category)

    expect(page).to have_content(category.title)
    expect(page).to have_content(idea.title)

    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
    expect(page).to have_link("Return to Main Category Page")
  end

  scenario "they can return to the main page" do

    category = create(:category)
    idea = Idea.create(title: "This Idea!", description:"It's a good one", category_id: Category.last.id)

    visit admin_category_path(category)

    click_on "Return to Main Category Page"

    expect(current_path).to eq(admin_categories_path)
  end

end
