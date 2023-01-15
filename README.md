# Spotify Authentication Flow Example With Ruby Webrick Webserver

This tutorial will replace Node.js with Ruby in the [Authentication Flow example app](https://github.com/spotify/web-api-auth-examples) for [Spotify Web API](https://developer.spotify.com/documentation/web-api/).

> This flow first gets a code from the Spotify Accounts Service, then exchanges that code for an access token. The code-to-token exchange requires a secret key, and for security is done through direct server-to-server communication.
In this example we retrieve data from the Web API /me endpoint, that includes information about the current user.

Here we will use Ruby for server-side applications.