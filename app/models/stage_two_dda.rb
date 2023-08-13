require 'csv'

class StageTwoDda < ApplicationRecord
  def self.to_csv
    attributes = %w{ player_fitness enemy_fitness weight_adjustment token created_at }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |stat|
        csv << [
          stat.player_fitness,
          stat.enemy_fitness,
          stat.weight_adjustment,
          stat.token,
          stat.created_at
        ]
      end
    end
  end
end
