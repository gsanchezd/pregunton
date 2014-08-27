class Game < ActiveRecord::Base
	belongs_to :user
	belongs_to :questionnaire
	has_many :answers, :dependent => :destroy
	
	def increment_score
		self.score = self.score + 1
		self.save
	end	
end
