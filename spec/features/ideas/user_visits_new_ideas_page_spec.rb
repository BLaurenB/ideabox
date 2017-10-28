require "rails_helper"

feature "User visits Create New Idea Page" do
  before do
    default = User.create(username: "penelope", password: "boom", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)
  end

  scenario "they fill in info to make a new idea" do

    # happy path

    # sad path

    category = create(:category)
    image =  Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")
    image =  Image.create(title: "Lightbulb", image_path: "https://images.pexels.com/photos/355952/pexels-photo-355952.jpeg?h=350&dpr=2&auto=compress&cs=tinysrgb")

    visit ideas_path
    click_on "Create a New Idea"
    expect(current_path).to eq(new_idea_path)

    fill_in "idea[title]", with: "Bake Something"
    fill_in "idea[description]", with: "Recipe Here!"
    select("Category Title 1", from: "idea[category_id]").select_option
    find('label[for="idea_id_1"]').click
    find('label[for="idea_id_2"]').click

    click_on "Create Idea"
    idea = Idea.last
    expect(current_path).to eq(idea_path(idea))
    # expect(page).to have_content("Bake Something")
    # expect(page).to have_content("Recipe Here!")

  end




end
