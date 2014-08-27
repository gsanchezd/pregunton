class AddSlugToQuestionnaire < ActiveRecord::Migration
  def change
    add_column :questionnaires, :slug, :string
    add_index :questionnaires, :slug, unique: true
  end
end
