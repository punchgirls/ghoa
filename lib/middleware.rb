require "cuba"

class Middleware
	def initialize(app)
		@app = app
	
		@routing = Cuba.new do
			on "github_oauth" do
	      on param("code") do |code|
	        access_token = Ghoa.fetch_access_token(code)

	        on access_token.nil? do
	          res.status = 401
	        end

	        on default do
	          #do something with the access_token
	        end
	      end

	      on get, root do
	        res.redirect Ghoa.authorize
	      end
	    end
		end
	end

	def call(env)
		@routing.call(env)
	end
end
