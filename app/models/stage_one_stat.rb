require 'csv'

class StageOneStat < ApplicationRecord
  def self.to_csv
    attributes = %w{ health time maze_algorithm maze_size token created_at }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |stat|
        csv << [stat.health, stat.time, stat.maze_algorithm, stat.maze_size, stat.token, stat.created_at]
      end
    end
  end
end
