class Alternative < ActiveRecord::Base
  belongs_to :question

  def correct?
  	return correct
  end

end
