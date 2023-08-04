class CreateStageTwoStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_two_stats do |t|
      t.column :kills, :float
      t.column :actions, :integer
      t.column :timer, :integer
      t.column :hits_taken, :float
      t.column :total_damage_taken, :float
      t.column :hit_miss_ratio, :float
      t.column :token, :string, index: true
      t.timestamps
    end
  end
end
