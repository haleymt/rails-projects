require 'rails_helper'

RSpec.feature "Auths", type: :feature do
  feature "the signup process" do

    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content "New User"
    end

    feature "signing up a user" do
      before(:each) do
        sign_up_as_haley
      end

      it "shows username on the homepage after signup" do
        expect(page).to have_content "Haley"
      end

    end
  end

  feature "logging in" do
    before(:each) do
      sign_up_as_haley
      click_button "Sign Out"
    end

    it "shows username on the homepage after login" do
      sign_in("Haley")
      expect(page).to have_content "Haley"
    end

  end

  feature "logging out" do
    before(:each) do
      sign_up_as_haley
    end

    it "begins with logged out state" do
      click_on "Sign Out"
      expect(page).to have_content "Sign In"
    end

    it "doesn't show username on the homepage after logout" do
      click_button "Sign Out"
      expect(page).not_to have_content "Haley"
    end
  end
end
