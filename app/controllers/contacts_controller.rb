class ContactsController < ApplicationController

def index
end

def new
	@contact = Contact.new
end

def create
	@contact = Contact.new(contact_params)

	if @contact.save
		flash[:notice] = "Contact has been created."
		redirect_to @contact
	else
		# nothing, yet
	end

def show
	@contact = Contact.find(params[:id])
end


end


private

def contact_params
	params.require(:contact).permit(:fname, :lname, 
		:description, :cell_phone, :email, :company,
		:first_met)
end

end


