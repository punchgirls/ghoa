require_relative "app"

# Redefine fetch_user method to fake GitHub response

module Ghoa
  def fetch_user(access_token)
    return { "id"=>"123456", :username=>"johndoe",
     :name=>"John Doe", :email=>"johndoe@mail.com" }
  end
end

scope do
  test "should redirect to GitHub login" do
    get "/github_oauth"

    assert_equal 302, last_response.status
  end

  # test "should inform User of successful login" do
  #   post "/github_login/117263273765215762"

  #   post "/confirm", { developer: { name: "John Doe",
  #     email: "johndoe@mail.com" }}

  #   puts last_response.body

  #   follow_redirect!

  #   assert last_response.body["You have successfully logged in!"]
  # end
end
