module Secured
  def authenticate_user!
    # Bearer xxxxxxxx
    token_regex = /Bearer (\w+)/
    # leer el HEADER de auth
    headers = request.headers
    # verificar que se valido
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
      # debemos verificar que el token corresponde a un usuario
      if (Current.user = User.find_by_auth_token(token))
        return
      end
    end
    render json: {error: 'Unauthorized'}, status: :unauthorized
  end
end