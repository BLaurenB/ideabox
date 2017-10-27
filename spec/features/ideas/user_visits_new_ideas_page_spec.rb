require "rails_helper"

feature "User visits Create New Image Page" do
  before do
    admin = User.create(username: "penelope", password: "boom", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

end
