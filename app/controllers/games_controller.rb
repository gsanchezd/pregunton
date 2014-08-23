class GamesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def new
    gon.questions_count = 3
    @questions = Question.limit(gon.questions_count)
    gon.destiny = lose_games_url
    gon.score = 0
    gon.watch.answers_count = 0
    session[:answers] = ""
    session[:score] = 0

  end


  def answer
    @answer = Alternative.find(params[:alternative])
    @question = @answer.question
    gon.q_id = @question.id
    session[:answers] << @answer.id

    if @answer.correct?
      session[:score] += 1
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

  def create
    Game.create(user_id:current_user.id, :score => session[:score])
    redirect_to top_games_path
  end
  
  def top
    @games = Game.all
  end
end
