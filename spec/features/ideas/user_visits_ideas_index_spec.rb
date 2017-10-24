require 'rails_helper'

describe "User visits Idea index page," do

  scenario "they see h1 and link to add new idea" do
    visit ideas_path

    within(:css, "h1") do
      expect(page).to have_content("Ideas")
    end
    
    expect(page).to have_link("Create a New Idea")
  end

  # scenario "they see all Ideas" do
  #   category = create(:category)
  #   image = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")
  #
  #   ideas = create_list(:idea, 3, category: category, image: image) #not sure if this will work
  #
  #   visit ideas_path
  #
  #   expect(page).to have_content(ideas[0].title)
  #   expect(page).to have_content(ideas[2].title)
  #   expect(page).to have_content(ideas[0].description)
  #   expect(page).to have_content(ideas[2].description)
  #   expect(page).to have_css("img[src*='pexels-photo-108941.jpeg']")
  #
  # end
  #
  # scenario "they can click edit" do
  #   category = create(:category)
  #   image = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")
  #
  #   ideas = create_list(:idea, 3, category: category, image: image) #not sure if this will work
  #
  #   visit ideas_path
  #
  #   click_on "Edit"
  #
  #   expect(current_path).to eq(edit_idea_path(ideas))
  # end
  #
  #
  # scenario "they can click edit" do
  #   category = create(:category)
  #   image = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")
  #
  #   ideas = create_list(:idea, 3, category: category, image: image) #not sure if this will work
  #
  #   visit ideas_path
  #
  #   click_on "Delete"
  #
  #   expect(current_path).to eq(ideas_path(ideas))
  # end


end
