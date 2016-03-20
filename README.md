# EQuip

Simple wrapper for Quip API v1 in Elixir 

##Authenication

Expects a Quip personal access token to be available in environment variable $QUIP_TOKEN. [Summon a token](https://quip.com/api/personal-token)

##Usage

###Client


The Quip API uses only GET and POST. 

    EQuip.Client.get("/threads/current")
    EQuip.Client.request(:get, "/threads/current")
    
    {:ok, map_of_response}


    EQuip.Client.post("/threads/new-document", map_of_post_data)
    EQuip.Client.request(:post, "/threads/new-document", map_of_post_data)

    {:ok, map_of_response}


[Check out the docs](https://slackernote.quip.com/api/reference#threads-get) to see all the stuff you can do.

## Installation

###ToDo: publish on Hex

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add e_quip to your list of dependencies in `mix.exs`:

        def deps do
          [{:e_quip, "~> 0.0.1"}]
        end

  2. Ensure e_quip is started before your application:

        def application do
          [applications: [:e_quip]]
        end

