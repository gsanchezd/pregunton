class QuestionnairesController < ApplicationController
	def index
		@questionnaires = Questionnaire.all
	end
	
	def show

	end

end
