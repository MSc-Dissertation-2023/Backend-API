class LeaderboardsController < ApplicationController
    def index
        records = Leaderboard.all
        records = records.order(score: :desc).limit(10)
        render json: records
    end 

    def create
        params['name']
        params['score']
        Leaderboard.create(name: params['name'], score: params['score'])
    end
end
