class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    user && user.authenticate(params[:password]) ? login(user) : failed
  end

  private

    def login(user)
      render json: UserSerializer.new(user)
    end

    def failed
      render json: { failed: 'Bad credentials' }, status: 401
    end
end
