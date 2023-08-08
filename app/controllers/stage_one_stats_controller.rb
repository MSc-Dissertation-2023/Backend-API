class StageOneStatsController < ApplicationController
    def index
        records = StageOneStats.all
        render json: records
    end

    def create
        StageOneStats.create(health: params['health'], time: params['time'], token: params['token'])
    end
end
