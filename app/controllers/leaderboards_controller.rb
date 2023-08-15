class LeaderboardsController < ApplicationController
  def index
    @records = Leaderboard.all.order(score: :desc).limit(500)

    respond_to do |format|
        format.json { render json: @records }
        format.html
    end
  end

  def create
    Leaderboard.create(name: params['name'], score: params['score'])
    render json: { message: 'Score Saved' }, status: :ok
  end

  def download
    
  end
end
