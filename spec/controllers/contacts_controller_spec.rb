require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  it "handles a missing contact correctly" do
    get :show, id: "not-here"
    expect(response).to redirect_to(contacts_path)

    message = "The contact you were looking for could not be found."
    expect(flash[:alert]).to eq message
end


end
