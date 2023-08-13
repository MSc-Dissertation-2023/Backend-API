require 'csv'

class StageTwoStat < ApplicationRecord
  def self.to_csv
    attributes = %w{ kills actions timer hits_taken total_damage_taken hit_miss_ratio token created_at }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |stat|
        csv << [
          stat.kills,
          stat.actions,
          stat.timer,
          stat.hits_taken,
          stat.total_damage_taken,
          stat.hit_miss_ratio,
          stat.token,
          stat.created_at
        ]
      end
    end
  end
end
