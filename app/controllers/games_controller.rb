class GamesController < ApplicationController
  def play
	@q_id = params[:q]
	@alt_id = params[:alt]

	if @q_id.nil?
		@question = Question.offset(rand(Question.count)).first
	else
		@question = Question.find(@q_id)
		@alternative = Alternative.find(@alt_id) 
	end

  end

  def new
  	redirect_to games_play_path
  end

end
