class GamesController < ApplicationController
  before_filter :authenticate_user!, :only => [:save]

  def play3
    @questions = Question.limit(10)
    gon.destiny = games_lose_url
    gon.score = 0
  end

  def play2
  #This is an experiment, using pagination to 
    @questions = Question.paginate(:page => params[:page], :per_page => 1)
    @question = @questions.first
    @completed = 100 * params[:page].to_i / @questions.count
  end

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
	session[:score] = 0
  	#game = current_user.games.build(:score => -1)
  	#game.save
  	redirect_to games_play_path
  end

  def answer
    @answer = Alternative.find(params[:alternative])
    @question = @answer.question
    gon.q_id = @question.id

    if @answer.correct?
      respond_to do |format|
        format.js {render 'correct'}
      end
    else
      respond_to do |format|
        format.js {render 'wrong'}
      end
    end
  end

  def lose
  end

  def save
  end
  
end
