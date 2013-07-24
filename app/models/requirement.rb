class Requirement < ActiveRecord::Base
	
	# Relationships
	belongs_to :weddy
	belongs_to :category

	validates :weddy_id, presence: true
	validates :category_id, presence: true
  	

	# Attributes
  	attr_accessible :category_id, :high_budget, :low_budget, :weddy_id
end
