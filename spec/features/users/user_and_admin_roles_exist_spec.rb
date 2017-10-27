require "rails_helper"

describe "User visits categories index page" do
  context "as admin" do
    it "allows admin to see all categories" do

      admin = User.create(username: "penelope", password: "boom", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content("Admin: All Categories")
      visit admin_images_path
      expect(page).to have_content("Admin: All Images")

    end
  end

  context "as default user" do
    it "does not allow default user to see admin views" do
      user = User.create(username: "fern@gully.com", password: 'password', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path
      expect(page).to_not have_content("Admin:")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
