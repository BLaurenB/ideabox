require "rails_helper"

feature "User visits edit page for an idea," do

  before do
    default = User.create(username: "penelope", password: "boom", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

    category = create(:category)
    idea = default.ideas.create(title: "This Idea!", description:"It's a good one", category_id: Category.last.id)
    image_1 = Image.create(title: "Lightbulb", image_path:"https://images.pexels.com/photos/355952/pexels-photo-355952.jpeg")
    image_2 = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")
    idea.images << image_1
    idea.images << image_2


# fill_in "idea[title]", with: "Bake Something"
# fill_in "idea[description]", with: "Recipe Here!"
# select("Category Title 1", from: "idea[category_id]").select_option
# find('label[for="idea_id_1"]').click
# find('label[for="idea_id_2"]').click


    visit edit_idea_path(idea)
  end

  scenario "they can edit the description" do
    fill_in "idea[title]", with: "New Title!"
    click_on "Update"

  end

  scenario "they can delete an image" do


  end

  scenario "they can add more images" do


  end


end
