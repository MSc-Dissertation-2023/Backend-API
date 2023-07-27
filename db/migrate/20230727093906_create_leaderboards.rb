class CreateLeaderboards < ActiveRecord::Migration[7.0]
  def change
    create_table :leaderboards do |t|
      t.column :name, :string
      t.column :score, :int
      t.timestamps
    end
  end
end
