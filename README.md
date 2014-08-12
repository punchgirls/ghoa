#Ghoa

A gem for hazzle-free GitHub authentication and retrival of user information.

> ##### Important information!
> To use this gem you must first register your application on GitHub.
> For more information on how to register your app and the GitHub 
> Oauth API have a look here:
> https://developer.github.com/guides/basics-of-authentication

##Usage

After registering on GitHub you will be provided with a
*Client ID* and a *Client Secret*. These keys will be used to
identify your application when communicating with the GitHub API.

To use the ghoa gem you need to require it, and set your API keys, 
like this:

```ruby
require "ghoa"

ghoa = Ghoa.new(client_id, client_secret)
```

Redirect the user to `ghoa.authorize_url` in order for them to 
authorize your application. 

As soon as the application is authorized the user will be 
redirected to the call back URL you provided when registering
the application.

In addition to the redirection, GitHub will add a code to the 
call back URL. The URL will look something like this:
`http://localhost:9393/github_oauth?code=71458a8b9256a976f156`

Use this code to fetch an Access Token. You will need the token
to retrieve the user's GitHub information:

```ruby
access_token = ghoa.fetch_access_token(code)
```

To fetch the user do:

```ruby
user = ghoa.fetch_user(access_token)
```

For more examples have a look at the test application that can be
found in `test/app.rb`

##Installation

```
$ gem install ghoa
```



