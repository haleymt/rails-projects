require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  feature "shows comments even if private" do
    haleys_goals
    make_comment("i am commenting")
    click_on('Edit Goal')
    check('Make Private')
    click_on('Update Goal')
    expect(page).to have_content 'i am commenting'
  end

  feature "creates a comment" do

    it "should fill in field on goal show page" do
      haleys_goals
      make_comment("i am commenting")
      expect(page).to have_content "i am commenting"
    end

    it "should fill in field on user show page" do
      sign_up_as_haley
      make_comment("i am commenting again!!")
      expect(page).to have_content "i am commenting again!!"
    end
  end

  feature "removes a comment" do
    it "should delete a comment" do
      sign_up_as_haley
      make_comment("i am commenting again!!")
      click_button("Delete")
      expect(page).not_to have_content "i am commenting again!!"
    end
  end

end
