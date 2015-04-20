require 'spec_helper'
require 'rails_helper'

feature "the goal creation process" do

  scenario "user creates a new goal" do
    signed_in_user
    add_a_goal("finish this app")
    expect(page).to have_content "finish this app"
  end

end

feature "the goal viewing process" do

  scenario "user views all their own goals" do
    signed_in_user
    add_a_goal("first goal")
    add_a_goal("second goal")
    visit goals_url
    expect(page).to have_content "first goal"
    expect(page).to have_content "second goal"
  end

  scenario "user views others' public goals" do
    signed_in_user
    add_a_goal("public goal")
    click_on "Log out"
    sign_up_as_user_two
    sign_in_as_user_two
    visit "/users/1"
    expect(page).to have_content "public goal"
  end

  scenario "user cannot view others' private goals" do
    signed_in_user
    add_a_goal("private goal", is_private = true)
    click_on "Log out"
    sign_up_as_user_two
    sign_in_as_user_two
    visit "/users/1"
    expect(page).not_to have_content "private goal"
  end

end

feature "the goal editing process" do

  scenario "user edits a goal from the show page" do
    signed_in_user
    add_a_goal("finish this app")
    click_link "Edit goal"
    expect(page).to have_content "Edit goal"
    fill_in "goal", with: "finish this application"
    click_on "Edit goal"
    expect(page).to have_content "finish this application"
  end

  scenario "user edits a goals from the index page" do
    signed_in_user
    add_a_goal("new goal at index page")
    visit goals_url
    click_link "Edit goal"
    expect(page).to have_content "Edit goal"
    fill_in "goal", with: "edit this goal at index page"
    click_on "Edit goal"
    expect(page).to have_content "edit this goal at index page"
  end

end

feature "the goal deletions process" do

  scenario "user deletes a goal from show page" do
    signed_in_user
    add_a_goal("finish this app")
    click_button "Delete goal"
    expect(page).to have_content "Goal deleted!"
    expect(page).to have_content "All my goals"
    expect(page).not_to have_content "finish this app"
  end

  scenario "user deletes a goal from the index page" do
    signed_in_user
    add_a_goal("new goal at index page")
    visit goals_url
    click_on "Delete goal"
    expect(page).to have_content "Goal deleted!"
    expect(page).to have_content "All my goals"
    expect(page).not_to have_content "new goal at index page"
  end

end

feature "goal completion" do

  feature "user adds new goal" do

    scenario "and goal defaults to incomplete" do
      signed_in_user
      add_a_goal("finish this app")
      expect(page).to have_content "Incomplete"
    end

    scenario "and marks goal as completed" do
      signed_in_user
      add_a_goal("finish this app")
      click_on "Edit goal"
      check "complete?"
      click_on "Edit goal"
      expect(page).to have_content "Complete"
    end

  end

end
