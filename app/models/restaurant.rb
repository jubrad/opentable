class Restaurant < ActiveRecord::Base

	belongs_to :owner

	validates_presence_of :name, :description, :owner_id
	validates_uniqueness_of :name
	
end
