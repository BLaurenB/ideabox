require 'rails_helper'

feature "Admin level user visits page to delete category," do

    scenario "click delete," do
      
      admin = User.create(username: "penelope", password: "boom", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      category = create(:category)
      Idea.create(title: "This Idea!", description:"It's a good one", category_id: Category.last.id)

      visit admin_category_path(category)

      click_button "Delete"

      expect(current_path).to eq(admin_categories_path)

    end

  end
