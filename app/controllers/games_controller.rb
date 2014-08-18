class GamesController < ApplicationController
  before_filter :authenticate_user!, :only => [:save]

  def play
	@q_id = params[:q]
	@alt_id = params[:alt]
	#@game = current_user.games.last
	if @q_id.nil?
		@question = Question.offset(rand(Question.count)).first
		session[:score] += 1
	else
		@question = Question.find(@q_id)
		@alternative = Alternative.find(@alt_id) 
	end
	@score = session[:score]

  end

  def new
	session[:score] = -1
  	#game = current_user.games.build(:score => -1)
  	#game.save
  	redirect_to games_play_path
  end

  def save
  end
  
end
