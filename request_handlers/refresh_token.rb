def process_refresh_token(request, response)
  url = 'https://accounts.spotify.com/api/token'
  data = {
    refresh_token: request.query['refresh_token'],
    grant_type: 'refresh_token'
  }
  res = RestClient.post url,
    data,
    {
      Authorization: "Basic #{Base64.strict_encode64($client_id + ':' + $client_secret)}"
    }

    render_json(res.body, response)
end
