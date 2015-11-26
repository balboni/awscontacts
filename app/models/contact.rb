class Contact < ActiveRecord::Base
	validates :lname, presence: true

  def full_name
  	"#{fname} #{lname}"
  end

end
