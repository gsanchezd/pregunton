class QuestionnairesController < ApplicationController
	before_action :set_questionaire, :only => [:show]
	def index
		@questionnaires = Questionnaire.all
	end
	
	def show
	end

	# def new
	# 	@questionnaire = Questionnaire.new
	# end

	# def create
	# 	@questionnaire = Questionnaire.new(questionnaire_params)
	# 	@questionnaire.save
	# 	redirect_to questionnaires_path
	# end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionaire
      @questionnaire = Questionnaire.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:name)
    end

end
