class GamesController < ApplicationController
  before_filter :authenticate_user!

  def play
	@q_id = params[:q]
	@alt_id = params[:alt]
	@game = current_user.games.last
	if @q_id.nil?
		@question = Question.offset(rand(Question.count)).first
		@game.increment_score
	else
		@question = Question.find(@q_id)
		@alternative = Alternative.find(@alt_id) 
	end

  end

  def new
  	game = current_user.games.build(:score => -1)
  	game.save
  	redirect_to games_play_path
  end

end
