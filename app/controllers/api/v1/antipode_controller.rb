class Api::V1::AntipodeController < ApplicationController
  def show
    render json: AntipodeSerializer.new(Antipode.new(params[:location]))
  end
end
