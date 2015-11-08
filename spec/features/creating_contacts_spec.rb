require "rails_helper"

RSpec.feature "Users can create new contacts" do
	scenario "with valid attributes" do
		visit "/"

		click_link "New Contact"

		fill_in "First Name", with: "Brian"
		fill_in "Last Name", with: "Balboni"
		click_button "Create Contact"

		expect(page).to have_content "Contact has been created."

		contact = Contact.find_by(fname: "Brian")
		expect(page.current_url).to eq contact_url(contact)

		title = "Brian - Contacts - Ticketee"
		expect(page).to have_title title
	end

end