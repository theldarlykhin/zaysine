class Store < ActiveRecord::Base

	belongs_to :merchant
	has_many :products


end
