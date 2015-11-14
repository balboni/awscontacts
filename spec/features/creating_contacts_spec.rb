require "rails_helper"

RSpec.feature "Users can create new contacts" do
	before do
		visit "/"

		click_link "New Contact"
	end

	scenario "with valid attributes" do

		fill_in "First Name", with: "Brian"
		fill_in "Last Name", with: "Balboni"
		click_button "Create Contact"

		expect(page).to have_content "Contact has been created."

		contact = Contact.find_by(fname: "Brian")
		expect(page.current_url).to eq contact_url(contact)

		title = "Brian - Contacts - Ticketee"
		expect(page).to have_title title
	end

	scenario "when providing invalid attributes" do

		click_button "Create Contact"

		expect(page).to have_content "Contact has not been created."
		expect(page).to have_content "Lname can't be blank"

end
end
