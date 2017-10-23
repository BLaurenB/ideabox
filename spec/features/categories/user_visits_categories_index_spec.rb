require 'rails_helper'


=begin
When a user (later will be Admin only) visits the Index page, they should see
 - a heading of categories
 - a link to a Create New Categories (or button)
 - a list of existing categories
 - links to edit and delete each category shown
=end

feature "User(ADMIN) visits Category index," do
  background { visit categories_path }

  scenario "they see a heading called Categories" do
    within(:css, "h1") do
      expect(page).to have_content("Categories")
    end
  end

  scenario "they can click a link to create a new category" do
    expect(page).to have_link(/create a new category/i)
  end

  scenario "they see a list of existing categories" do
    categories = create_list(:category, 2)
    expect(page).to have_content(categories[0].title)
    expect(page).to have_content(categories[1].title)
  end

  scenario "they see Edit and Delete options for each category listed" do
    categories = create_list(:category, 2)
    expect(page).to have_content(/edit/i).twice
    expect(page).to have_content(/delete/i).twice
  end

end
