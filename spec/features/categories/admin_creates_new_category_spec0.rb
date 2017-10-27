require 'rails_helper'

feature "Admin level user visits page to create new category," do

  before do
    admin = User.create(username: "penelope", password: "boom", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end


  scenario "they see a heading called Create a New Category" do
    visit new_admin_category_path
    expect(page).to have_content("Create a New Category")
  end

  scenario "they fill in the form to create a new category," do
    visit new_admin_category_path
    fill_in "category[title]", with: "This Is Another Category"
    click_on "Create Category"

    category = Category.last

    expect(current_path).to eq(admin_category_path(category))
    expect(page).to have_content("This Is Another Category")
  end

end
