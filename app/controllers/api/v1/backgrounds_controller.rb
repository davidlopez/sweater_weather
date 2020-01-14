class Api::V1::BackgroundsController < ApplicationController

  def index
    render json: BackroundSerializer(Backround.new(params[:location]))
  end
end
