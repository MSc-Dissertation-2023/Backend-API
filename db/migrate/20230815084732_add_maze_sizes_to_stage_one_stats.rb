class AddMazeSizesToStageOneStats < ActiveRecord::Migration[7.0]
  def change
    add_column :stage_one_stats, :maze_size, :int
  end
end
