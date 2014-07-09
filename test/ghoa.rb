require "cuba/test"
require_relative "app"

class Ghoa
  def fetch_access_token(code)
    return "078e5ae742d852d5b96723772469fbb4f65acd82"
  end
end

scope do
  test "get GitHub access token" do
    get "/github_oauth?code=cfe70752888bb01f6c1a"

    assert_equal 302, last_response.status
  end
end