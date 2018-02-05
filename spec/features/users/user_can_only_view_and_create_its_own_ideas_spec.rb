require "rails_helper"

describe "When a User visits Idea Box, " do

  before do
    default = User.create(username: "penelope", password: "penelope", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

    category = create(:category)
    @idea = default.ideas.create(title:"IDEA TITLE", description:"IDEA DESCR", category_id: Category.last.id)
    image_1 = Image.create(title: "Lightbulb", image_path:"https://images.pexels.com/photos/355952/pexels-photo-355952.jpeg")
    @idea.images << image_1

  end



  describe "and creates a new idea, " do
    scenario "they see their idea show page" do
      visit idea_path(@idea)
      expect(page).to have_content("IDEA TITLE")
    end
  end


  describe "When authenticated User views their ideas" do
    scenario "they see all ideas they created" do

    end 
  end

  describe "When user visits Ideas Index page, they only see their ideas" do


  end

end
