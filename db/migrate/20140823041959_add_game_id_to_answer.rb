class AddGameIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :game_id, :integer
  end
end
