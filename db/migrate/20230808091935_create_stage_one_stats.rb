class CreateStageOneStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_one_stats do |t|
      t.column :health, :int
      t.column :time, :int
      t.column :token, :string, index: true
      t.timestamps
    end
  end
end
