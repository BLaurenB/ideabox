require 'rails_helper'


feature "Admin level user visits Category index," do
  scenario "they see a heading called Categories" do
    visit admin_categories_path
    expect(page).to have_content("Categories")
  end

  scenario "they can click a link to create a new category" do
    visit admin_categories_path
    expect(page).to have_link("Create a New Category")
  end

  scenario "they see a list of existing categories" do
    category1 = Category.create(title: "Idea1")
    category2 = Category.create(title: "Idea2")
    visit admin_categories_path
    expect(page).to have_content("Idea1")
    expect(page).to have_content("Idea2")
  end

  scenario "they see Edit and Delete options for each category listed" do
    categories = create_list(:category, 2)
    visit admin_categories_path
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end

end
