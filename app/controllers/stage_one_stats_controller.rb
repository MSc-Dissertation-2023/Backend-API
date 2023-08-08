class StageOneStatsController < ApplicationController
    def index
        records = StageOneStat.all
        render json: records
    end

    def create
        StageOneStat.create(health: params['health'], time: params['time'], token: params['token'])
    end
end
