require 'rails_helper'

describe "User visits Idea index page," do

  scenario "they see h1 and link to add new idea" do
    visit ideas_path

    within(:css, "h1") do
      expect(page).to have_content("Ideas")
    end

    expect(page).to have_link("Create a New Idea")
  end

  scenario "they see all Ideas" do
    category = create(:category)
    image = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")

    idea_1 = Idea.create(title: "omg1", description: "omg1descr", category_id: category.id)
    idea_2 = Idea.create(title: "omg2", description: "omg2descr", category_id: category.id)

    visit ideas_path

    # expect(page).to have_css("img[src*='pexels-photo-108941.jpeg']")
    expect(page).to have_content("omg1")
    expect(page).to have_content("omg2")

  end

  # scenario "they can click on the Idea to see the show page" do
  #   category = create(:category)
  #   image = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")
  #
  #   idea_1 = Idea.create(title: "omg1", description: "omg1descr", category_id: category.id)
  #
  #   visit ideas_path
  #
  #   click_link "omg1"
  #
  #   expect(current_path).to eq(idea_path(idea))
  # end

  scenario "they can click edit" do
    category = create(:category)
    image = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")

    idea = Idea.create(title: "omg1", description: "omg1descr", category_id: category.id)

    visit ideas_path

    click_on "Edit"

    expect(current_path).to eq(edit_idea_path(idea))
  end

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
