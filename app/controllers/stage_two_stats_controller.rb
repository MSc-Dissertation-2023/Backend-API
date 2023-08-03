class StageTwoStatsController < ApplicationController
  # def index
  # end
  def create
    StageTwoStat.create(
      kills: params['kills'],
      actions: params['actions'],
      timer: params['timer'],
      hits_taken: params['hits_taken'],
      total_damage_taken: params['total_damage_taken'],
      hit_miss_ratio: params['hit_miss_ratio'],
      token: params['token']
    )

    render json: { message: 'created' }, status: :ok
  end
end
