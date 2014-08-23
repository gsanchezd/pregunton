class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :alternative
  belongs_to :game
end
