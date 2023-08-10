class StageTwoDdaController < ApplicationController
  def index
    stats = StageTwoDda.all.order(:created_at)

    render json: stats, status: :ok
  end

  def create
    StageTwoDda.create(
      player_fitness: params['player_fitness'],
      enemy_fitness: params['enemy_fitness'],
      weight_adjustment: params['weight_adjustment'],
      token: params['token']
    )

    render json: { message: 'created' }, status: :ok
  end
end
