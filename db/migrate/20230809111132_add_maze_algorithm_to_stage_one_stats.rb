class AddMazeAlgorithmToStageOneStats < ActiveRecord::Migration[7.0]
  def change
    add_column :stage_one_stats, :maze_algorithm, :string
  end
end
