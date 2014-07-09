require "cuba"
require_relative "../lib/ghoa"

Cuba.define do
  ghoa = Ghoa.new("client_id", "client_secret")

  on "github_oauth" do
    on param("code") do |code|
      access_token = ghoa.fetch_access_token(code)

      on access_token.nil? do
        res.status = 401
      end

      on default do
        res.status = 302
      end
    end

    on get, root do
      res.redirect ghoa.authorize
    end
  end
end