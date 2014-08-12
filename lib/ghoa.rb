require "requests"

class Ghoa
  AUTHORIZE_URL = "https://github.com/login/oauth/authorize?client_id=%s"
  ACCESS_TOKEN_URL = "https://github.com/login/oauth/access_token"
  USER_URL = "https://api.github.com/user"

  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def authorize_url
    return sprintf(AUTHORIZE_URL, @client_id)
  end

  def fetch_access_token(code)
    response = Requests.request("POST", ACCESS_TOKEN_URL,
      data: { client_id: @client_id,
              client_secret: @client_secret,
              code: code },
      headers: { "Accept" => "application/json" })

    return response.json["access_token"]
  end

  def fetch_user(access_token)
    params = { access_token: access_token }
    response = Requests.request("GET", USER_URL, params: params)

    return response.json
  end
end
