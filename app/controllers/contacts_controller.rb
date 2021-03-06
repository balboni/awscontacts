class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]

def index
	@contacts = Contact.all
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
		flash.now[:alert] = "Contact has not been created."
		render "new"
	end
  end

def show
	@contact = Contact.find(params[:id])
end

def edit
	@contact = Contact.find(params[:id]) 
end

def update
	@contact = Contact.find(params[:id])
	@contact.update(contact_params)

	flash[:notice] = "Contact has been updated."
	redirect_to @contact
end

def destroy
	@contact = Contact.find(params[:id])
	@contact.destroy

	flash[:notice] = "Contact has been deleted."
	redirect_to contacts_path
end

end


private

def set_contact
  @contact = Contact.find(params[:id])
  rescue ActiveRecord::RecordNotFound

  flash[:alert] = "The contact you were looking for could not be found."
  redirect_to contacts_path
end

def contact_params
	params.require(:contact).permit(:fname, :lname, 
		:description, :cell_phone, :email, :company,
		:first_met, :spouse, :children)
end



