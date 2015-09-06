class Invoice < ActiveRecord::Base

	before_save :generate_random_id

	def generate_random_id
	   #generates a random hex string of length 6
	   self.random_id = SecureRandom.hex(3)
	end
end
