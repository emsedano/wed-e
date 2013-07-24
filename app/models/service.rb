class Service < ActiveRecord::Base
# Relationships
	belongs_to :supplier
	has_one :category
	has_one :pricing_type

  attr_accessible :category_id, :description, :name, :pricing1, :pricing2, :pricing3, :pricing_type_id, :supplier_id
end
