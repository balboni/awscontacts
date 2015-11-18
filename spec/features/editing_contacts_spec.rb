require "rails_helper"

RSpec.feature "Users can edit existing contacts" do  
	scenario "with valid attributes" do  
		FactoryFirl.create(:contact, fname: "Trisha", lname: "Obert")

		visit "/"
		click_link "Obert"
		click_link "Edit Contact"
		fill_in "fname", with: "Tina"
		click_button "Update Project"

		expect(page).to have_content "Contact has been updated."
		expect(page).to have_content "Obert"
	end
end

