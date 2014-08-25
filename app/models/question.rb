class Question < ActiveRecord::Base
	belongs_to :questionnaire
	has_many :alternatives, :dependent => :destroy
	accepts_nested_attributes_for :alternatives
end
