class Message < ApplicationRecord
	before_save :add_hash

	def add_hash
		self.digest = Digest::SHA256.hexdigest self.content
	end
end
