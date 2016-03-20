defmodule EQuip.Client do
  @base_url "https://platform.quip.com/1"

  def request(http_method, path) when http_method == :get do
    HTTPoison.request(http_method, url(path), "", headers, [])
    |> process_response
  end

  def request(http_method, path, data) when http_method == :post do
    HTTPoison.request(http_method, url(path), encode(data), headers, [])
    |> process_response
  end

  def token do
    System.get_env("QUIP_TOKEN")
  end

  def get(path) do
    request(:get, path)
  end

  def post(path, data) do
    request(:post, path, data)
  end

  defp process_response(res) do
    case res do
      {:ok, %HTTPoison.Response{body: body}} ->
        body = parse_body(body)
        {:ok, body}

      {:error, error} -> {:error, error}
    end
  end

  defp parse_body(body) do
    Poison.decode!(body)
  end

  defp headers do
    val = "Bearer " <> token
    ["Authorization": val]
  end

  defp url(path), do: @base_url <> path
  defp encode(data), do: URI.encode_query(data)
end
