class StageTwoStatsController < ApplicationController

  def index
    @records = StageTwoStat.all.order(:created_at)

    respond_to do |format|
      format.json { render json: @records, status: :ok }
      format.html
    end
  end

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

  def download
    @records = StageTwoStat.all.order(:created_at)

    respond_to do |format|
      format.csv do
        send_data @records.to_csv, filename: "[MDK2023] Stage Two Stats - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).csv"
      end
    end
  end
end
