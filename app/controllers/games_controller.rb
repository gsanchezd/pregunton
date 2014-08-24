class GamesController < ApplicationController
  #before_filter :authenticate_user!, :only => [:create]

  def new
    gon.questions_count = 10
    @questions = Question.limit(gon.questions_count)
    gon.questions_count = @questions.count  #Fixing the value in the case that is less
    gon.destiny = lose_games_url
    gon.score = 0
    gon.watch.answers_count = 0
    session[:answers] = []
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

  def create
    if current_user.nil?
      user = User.create(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
      user.save!(:validate => false)
    else 
      user = current_user
    end

    game = Game.create(user:user, :score => session[:score])

    session[:answers].each do |alt|
      ans = Answer.create(:alternative => Alternative.find(alt), :game => game, :user => user)
    end

    redirect_to top_games_path
  end
  
  def top
    @games = Game.all
  end
end
