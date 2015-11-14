class Contact < ActiveRecord::Base
	validates :lname, presence: true
end
