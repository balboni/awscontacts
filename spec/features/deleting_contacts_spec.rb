require "rails_helper"

RSpec.feature "Users can delete contacts" do  
	scenario "successfully" do  
		FactoryGirl.create(:contact, fname: "Elizabeth", lname: "Banks")

		visit "/"
		click_link "Banks"
		click_link "Delete Contact"

		expect(page).to have_content "Contact has been deleted."
		expect(page.current_url).to eq contacts_url
		expect(page).to have_no_content "Banks"
	end
end

