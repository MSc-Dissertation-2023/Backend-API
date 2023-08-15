class GuestTokensController < ApplicationController
  def create
    payload = {
      iat: DateTime.current.to_i,
      jti: SecureRandom.uuid
    }

    token = JWT.encode payload, nil, 'none'
    GuestToken.create(token: token)

    respond_to do |format|
      format.json { render json: token, status: :ok }
    end
  end
end
