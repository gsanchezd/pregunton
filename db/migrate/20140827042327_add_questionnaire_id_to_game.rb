class AddQuestionnaireIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :questionnaire_id, :integer
  end
end
