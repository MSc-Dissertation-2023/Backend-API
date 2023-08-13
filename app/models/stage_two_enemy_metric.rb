require 'csv'

class StageTwoEnemyMetric < ApplicationRecord
  def self.to_csv
    attributes = %w{ total_fitness current_fitness previous_fitness live_enemies_count dead_enemies_count token created_at }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |stat|
        csv << [
          stat.total_fitness,
          stat.current_fitness,
          stat.previous_fitness,
          stat.live_enemies_count,
          stat.dead_enemies_count,
          stat.token
          stat.created_at
        ]
      end
    end
  end
end
