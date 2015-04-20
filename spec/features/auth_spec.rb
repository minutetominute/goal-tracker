require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
      sign_up_as_testing_username
    end

    it "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end
  end

end

feature "logging in" do
  before(:each) do
    sign_up_as_testing_username
    sign_in_as_testing_username
  end

  it "shows username on the homepage after login" do
    expect(page).to have_content "testing_username"
  end

end

feature "logging out" do
  it "begins with logged out state" do
    visit root_url
    expect(page).not_to have_content "Log out"
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_as_testing_username
    sign_in_as_testing_username
    click_on "Log out"
    expect(page).not_to have_content "Log out"
  end
end
