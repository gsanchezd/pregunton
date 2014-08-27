class Questionnaire < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, :use => :slugged
  has_many :questions
  has_many :games  
end
