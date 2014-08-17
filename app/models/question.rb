class Question < ActiveRecord::Base
	has_many :alternatives
	accepts_nested_attributes_for :alternatives
end
