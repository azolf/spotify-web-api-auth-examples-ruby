# frozen_string_literal: true

def process_callback(request, response)
  state_cookie = request.cookies.select { |c| c.name == 'spotify_auth_state' }.first
  raise 'error' unless state_cookie.value == request.query['state']

  data = {
    code: request.query['code'],
    grant_type: 'authorization_code',
    redirect_uri: $callback_url
  }

  res = RestClient.post(
    'https://accounts.spotify.com/api/token',
    data,
    {
      Authorization: "Basic #{Base64.strict_encode64($client_id + ':' + $client_secret)}"
    }
  )

  result = JSON.parse(res.body)

  params = {
    access_token: result['access_token'],
    refresh_token: result['refresh_token']
  }
  uri = URI('/me')
  uri.query = URI.encode_www_form(params)

  response.set_redirect(WEBrick::HTTPStatus::TemporaryRedirect, uri.to_s)
end
