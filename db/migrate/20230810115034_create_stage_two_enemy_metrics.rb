class CreateStageTwoEnemyMetrics < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_two_enemy_metrics do |t|
      t.float :total_fitness
      t.float :current_fitness
      t.float :previous_fitness
      t.integer :live_enemies_count
      t.integer :dead_enemies_count
      t.string :token
      t.timestamps
    end
  end
end
