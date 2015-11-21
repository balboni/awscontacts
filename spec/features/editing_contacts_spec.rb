require "rails_helper"

RSpec.feature "Users can edit existing contacts" do  
	before do 
		FactoryGirl.create(:contact, fname: "Tina", lname: "Obert")

		visit "/"
		click_link "Obert"
		click_link "Edit Contact"
	end

	scenario "with valid attributes" do 
		fill_in "First Name", with: "Trisha"
		click_button "Update Contact"

		expect(page).to have_content "Contact has been updated."
		expect(page).to have_content "Trisha"
	end

	scenario "when providing invalid attributes" do  
		fill_in "First Name", with: ""
		click_button "Update Contact"

		expect(page).to have_content "Contact has not been updated."
	end
end

