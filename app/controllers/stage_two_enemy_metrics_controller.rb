class StageTwoEnemyMetricsController < ApplicationController
  def index
    stats = StageTwoEnemyMetric.all.order(:created_at)

    render json: stats, status: :ok
  end

  def create
    StageTwoEnemyMetric.create(
      total_fitness: params['total_fitness'],
      current_fitness: params['current_fitness'],
      previous_fitness: params['previous_fitness'],
      live_enemies_count: params['live_enemies_count'],
      dead_enemies_count: params['dead_enemies_count'],
      token: params['token']
    )

    render json: { message: 'created' }, status: :ok
  end
end
