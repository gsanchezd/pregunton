class Game < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	
	def increment_score
		self.score = self.score + 1
		self.save
	end	
end
