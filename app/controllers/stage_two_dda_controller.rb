class StageTwoDdaController < ApplicationController
  def index
    @records = StageTwoDda.all.order(:created_at)

    respond_to do |format|
      format.json { render json: @records, status: :ok }
      format.html
    end
  end

  def create
    StageTwoDda.create(
      player_fitness: params['player_fitness'],
      enemy_fitness: params['enemy_fitness'],
      weight_adjustment: params['weight_adjustment'],
      token: params['token']
    )

    render json: { message: 'Stage Two DDA Stat saved' }, status: :ok
  end

  def download
    @records = StageTwoDda.all

    respond_to do |format|
      format.csv do
        send_data @records.to_csv, filename: "[MDK2023] Stage Two DDA - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).csv"
      end
    end
  end
end
