require "rails_helper"

feature "User visits Create New Idea Page" do
  before do
    default = User.create(username: "penelope", password: "boom", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)
  end

  scenario "they fill in info to make a new idea" do
    category = create(:category)
    image =  Image.create(title: "Rainbow", image_path: "https://static.pexels.com/photos/108941/pexels-photo-108941.jpeg")

    visit ideas_path
    click_on "Create a New Idea")
    expect(current_path).to eq(new_idea_path)

    fill_in "idea[title]", with: "Bake Something"
    fill_in "idea[description]", with: "Recipe Here!"
    select("Category Title 1", from: "idea[category_id]").select_option
    find(:css, "#cityID[value='62']").set(true)
    check('A Checkbox')

    click_on checkbox... x2?
    click_on

  end


  scenario "they are able to add more than one image to an idea" do



  end

end
