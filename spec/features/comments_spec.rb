require 'spec_helper'
require 'rails_helper'

feature "user comments on goal" do

  scenario "creates a goal and comments on it" do
    signed_in_user
    add_a_goal("new goal here")
    visit "/users/1"
    click_on "comment"
    fill_in 'comment', with: "great comment here"
    click_on 'submit comment'
    expect(page).to have_content "great comment here"
  end

end

feature "user comments on user" do

  scenario "user creates comment on other user's page" do
    signed_in_user
    logout
    sign_up_as_user_two
  end

end
