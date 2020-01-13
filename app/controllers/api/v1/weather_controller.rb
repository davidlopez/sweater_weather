class Api::V1::WeatherController < ApplicationController
  def index
    render json: ForecastSerializer.new(Forecast.new(params[:location]))
  end
end
