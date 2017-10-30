require "rails_helper"

feature "User visits idea show page," do
  # happy path - they see all the stuff and they can only see ideas that they created
  scenario "they see the title, description, and images for an idea" do
    default = User.create(username: "penelope", password: "boom", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

    category = create(:category)
    idea = default.ideas.create(title: "This Idea!", description:"It's a good one", category_id: Category.last.id)
    image_1 = Image.create(title: "Lightbulb", image_path:"https://images.pexels.com/photos/355952/pexels-photo-355952.jpeg")
    image_2 = Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")
    idea.images << image_1
    idea.images << image_2

    visit idea_path(idea)

    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.description)
    expect(page).to have_css("img[src*='pexels-photo-355952.jpeg']")
    expect(page).to have_css("img[src*='pexels-photo-108941.jpeg']")
  end

    # sad path - they can see ideas that they didn't create...currently true. I need to associate ideas with a user by adding a column to users. then I'll need to change all my stuff using where statements

end
