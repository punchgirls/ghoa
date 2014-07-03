require "cuba"
require "requests"

Cuba.define do
  on "github_oauth" do
    on param("code") do |code|
      access_token = Ghoa.fetch_access_token(code)

      on access_token.nil? do
        res.status = 401
      end

      on default do
        res.status = 302
      end
    end

    on get, root do
      res.redirect Ghoa.authorize
    end
  end

  on "login" do
    user = JSON.parse((Requests.request("GET", "https://api.github.com/user",
      params: { access_token: access_token })).body)

    on user.nil? do
      res.status = 403
    end

    on default do
      res.write user
    end
  end
end
