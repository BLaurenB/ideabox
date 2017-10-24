require 'rails_helper'

describe "Admin visits Image index," do
  scenario "they see h1 and link to create new images" do
    Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")

    visit images_path

    expect(page).to have_content("Images")
    expect(page).to have_link("Create a New Image")
  end


  scenario "they see images as well as titles, edit, and delete options" do
    Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")

    visit images_path

    expect(page).to have_content("Images")
    expect(page).to have_css("img[src*='pexels-photo-108941.jpeg']")
    expect(page).to have_button("Delete")
  end

  scenario "they click Create New Image" do
    Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")

    visit images_path
    click_on "Create a New Image"

    expect(current_path).to eq(new_image_path)
  end


  scenario "they click Delete" do
    Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")

    visit images_path
    click_on "Delete"

    expect(current_path).to eq(images_path)
  end

end
