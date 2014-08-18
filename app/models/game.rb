class Game < ActiveRecord::Base
	belongs_to :user

	def increment_score
		self.score = self.score + 1
		self.save
	end	
end
