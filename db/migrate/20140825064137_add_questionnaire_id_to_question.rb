class AddQuestionnaireIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :questionnaire_id, :integer
  end
end
