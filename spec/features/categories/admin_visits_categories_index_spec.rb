require 'rails_helper'


=begin
When a user (later will be Admin only) visits the Index page, they should see
 - a heading of categories
 - a link to a Create New Categories (or button)
 - a list of existing categories
 - links to edit and delete each category shown
=end

feature "Admin level user visits Category index," do
  scenario "they see a heading called Categories" do
    visit categories_path
    within(:css, "h1") do
      expect(page).to have_content("Categories")
    end
  end

  scenario "they can click a link to create a new category" do
    visit categories_path
    expect(page).to have_link("Create a New Category")
  end

  scenario "they see a list of existing categories" do
    category1 = Category.create(title: "Idea1")
    category2 = Category.create(title: "Idea2")
    visit categories_path
    expect(page).to have_content("Idea1")
    expect(page).to have_content("Idea2")
  end

  scenario "they see Edit and Delete options for each category listed" do
    categories = create_list(:category, 2)
    visit categories_path
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end

end
