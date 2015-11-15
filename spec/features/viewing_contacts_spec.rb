require "rails_helper"

RSpec.feature "Users can view contacts" do 
	scenario "with the contact details" do 
		contact = FactoryGirl.create(:contact, fname: "Miranda", lname: "Carfrae")

		visit "/"
		click_link "Carfrae"
		expect(page.current_url).to eq contact_url(contact)
	end
end
