class StageOneStatsController < ApplicationController
  def index
    @records = StageOneStat.all.order(:created_at)

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
      maze_algorithm: params['maze_algorithm'],
      maze_size: params['maze_size']
    )
    render json: { message: 'Stage One Stat Saved' }, status: :ok
  end

  def download
    @records = StageOneStat.all

    respond_to do |format|
      format.csv do
        send_data @records.to_csv, filename: "[MDK2023] Stage One Stats - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).csv"
      end
    end
  end
end
