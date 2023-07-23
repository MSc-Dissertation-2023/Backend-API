class GuestTokensController < ApplicationController
  def create
    payload = {
      iat: DateTime.current.to_i,
      jti: SecureRandom.uuid
    }

    token = JWT.encode payload, nil, 'none'
    GuestToken.create(token: token)

    render json: token
  end
end
