class GamesController < ApplicationController
  #before_filter :authenticate_user!, :only => [:create]

  def new
    gon.questions_count = 20
    @questions = Question.limit(gon.questions_count).shuffle
    gon.questions_count = @questions.count  #Fixing the value in the case that is less
    gon.destiny_path = lose_games_url
    gon.save_time_left_path = save_time_left_games_url

    gon.score = 0
    gon.time_score = 0
    gon.watch.answers_count = 0

    session[:answers] = []
    session[:score] = 0
    session[:time_score] = 0
  end


  def answer
    @answer = Alternative.find(params[:alternative])
    @question = @answer.question
    gon.q_id = @question.id
    session[:answers] << @answer.id
    if @answer.correct?
      session[:score] += 3
      respond_to do |format|
        format.js {render 'correct'}
      end
    else
      respond_to do |format|
        session[:score] -= 3
        format.js {render 'wrong'}
      end
    end
  end

  def create
    if current_user.nil?
      random_name = "guest_#{Time.now.to_i}#{rand(100)}"
      user = User.create(:name => random_name, :email => random_name + "_@example.com")
      user.save!(:validate => false)
    else 
      user = current_user
    end

    game = Game.create(user:user, :score => session[:score] + session[:time_score])

    session[:answers].each do |alt|
      ans = Answer.create(:alternative => Alternative.find(alt), :game => game, :user => user)
    end

    redirect_to top_games_path
  end
  
  def save_time_left
    time_left = params[:time_left]
    session[:time_left] = time_left
    time_score = time_left.to_i / 5
    session[:time_score] = time_score
    gon.time_score = time_score

    respond_to do |format|
      format.js
    end
  end

  def top
    @games = Game.all
  end
end
