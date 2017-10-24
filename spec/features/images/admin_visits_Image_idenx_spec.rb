require 'rails_helper'

describe "Admin visits Image index," do
  scenario "they see images as well as titles, edit, and delete options" do
    image = create(:image)

    visit images_path

    expect(page).to have_css("img[src*='xxx.jpg']")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end

end
