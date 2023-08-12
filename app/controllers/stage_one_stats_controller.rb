class StageOneStatsController < ApplicationController
  def index
    @records = StageOneStat.all

    respond_to do |format|
      format.json { render json: @records, status: :ok }
      format.html
    end
  end

  def create
    StageOneStat.create(
      health: params['health'],
      time: params['time'],
      token: params['token'],
      maze_algorithm: params['maze_algorithm']
    )
    render json: { message: 'Stage One Stat Saved' }, status: :ok
  end
end
