require 'rails_helper'

describe "User visits Image index," do
  before do
    admin = User.create(username: "penelope", password: "boom", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  scenario "they see h1 and link to create new images" do
    visit new_admin_image_path

    fill_in 'image[title]', with: "Rainbow"
    fill_in 'image[image_path]', with: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg"
    click_on "Create Image"

    expect(current_path).to eq(admin_images_path)
    expect(page).to have_content("Rainbow")
    expect(page).to have_css("img[src*='pexels-photo-108941.jpeg']")
  end
end
