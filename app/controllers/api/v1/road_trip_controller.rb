class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    user ? roadtrip : failed
  end

  private

    def roadtrip
      render json: RoadtripSerializer.new(Roadtrip.new(params[:origin], params[:destination]))
    end

    def failed
      render json: { failed: 'Unauthorized' }, status: 401
    end
end
