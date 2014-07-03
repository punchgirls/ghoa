require "requests"

class Ghoa
  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def authorize
    return "https://github.com/login/oauth/authorize?client_id=#{ @client_id }"
  end

  def fetch_access_token(code)
    response = Requests.request("POST", "https://github.com/login/oauth/access_token",
      data: { client_id: @client_id,
              client_secret: @client_secret,
              code: code },
      headers: { "Accept" => "application/json" })

    return JSON.parse(response.body)["access_token"]
  end
end
