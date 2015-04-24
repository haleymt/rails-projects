require 'rails_helper'

RSpec.feature "Goals", type: :feature do

  feature "list all the goals" do
    before(:each) do
      haleys_goals
      click_button "Sign Out"
      sign_up("chris")
      visit goals_url
    end
    it "is on the index page" do
      expect(page).to have_content "All Goals"
    end

    it "should not show private goals" do
      expect(page).not_to have_content "Run!"
    end

    it "should show public goals" do
      expect(page).to have_content "Swim!"
    end

    it "should have a link to each goal" do
      click_link('Swim!')
      expect(page).to have_content "Comments"
    end

    it "should show the username when logged in" do
      expect(page).to have_content "chris"
    end

    it "should show username that the goal belongs to" do
      expect(page).to have_content "Haley"
    end
  end

  feature "creating a goal" do
    before(:each) do
      sign_up_as_haley
      visit goals_url
      click_link "New Goal"
    end

    it "should go to the new goal page" do
      expect(page).to have_content "New Goal"
    end

    it "should validate that the body is not blank" do
      fill_in 'Body', with: ''
      click_button "Create Goal"
      expect(page).to have_content "Body can't be blank"
      expect(page).to have_content "New Goal"
    end

    it "should redirect to goal's show page" do
      fill_in 'Body', with: 'Im a body'
      click_button "Create Goal"
      expect(page).to have_content "Im a body"
    end

    it "should belong to the current user" do
      make_goal("body", true)
      click_button "Edit Goal"
      expect(page).to have_content "Edit Goal"
    end
  end

  feature "show a goal" do
    before(:each) do
      haleys_goals
    end
    it "should show the body and username of the goal" do
      expect(page).to have_content "Swim!"
      expect(page).to have_content "Haley"
    end

    it "should show comments on the goal" do
      #make a comment for here
    end

    it "should show a link back to the goal index" do
      click_link("Goals")
      expect(page).to have_content "All Goals"
    end

    it "should have a button to remove the goal" do
      click_button("Delete Goal")
      expect(page).to have_content "All Goals"
      expect(page).not_to have_content "Swim!"
    end

  end

  feature "edit a goal" do
    before(:each) do
      haleys_goals
      click_button "Edit Goal"
    end

    it "should go to the edit goal page " do
      expect(page).to have_content "Edit Goal"
    end

    it "should validate that the body is not blank" do
      fill_in 'Body', with: ''
      click_button "Update Goal"
      expect(page).to have_content "Body can't be blank"
      expect(page).to have_content "Edit Goal"
    end

    it "should update the attributes and redirect" do
      fill_in 'Body', with: 'new body!'
      click_button "Update Goal"
      expect(page).to have_content "new body!"
    end
  end
end
