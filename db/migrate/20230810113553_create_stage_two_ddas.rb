class CreateStageTwoDdas < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_two_ddas do |t|
      t.float :player_fitness
      t.float :enemy_fitness
      t.float :weight_adjustment
      t.string :token
      t.timestamps
    end
  end
end
