require "cuba"
require_relative "../lib/ghoa"

CLIENT_ID = ENV.fetch("CLIENT_ID")
CLIENT_SECRET = ENV.fetch("CLIENT_SECRET")

Cuba.define do
  ghoa = Ghoa.new(CLIENT_ID, CLIENT_SECRET)

  on "github_oauth" do
    on param("code") do |code|
      access_token = ghoa.fetch_access_token(code)

      on access_token != nil do
        user = ghoa.fetch_user(access_token)

        res.write JSON.dump(user)
      end

      on default do
        res.write "An error occured!"
      end
    end

    on get, root do
      res.redirect ghoa.authorize_url
    end
  end
end
