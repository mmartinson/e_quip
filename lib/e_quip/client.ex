defmodule EQuip.Client do
  @base_url "https://platform.quip.com/1"

  def call(http_method, path) do
    case http_method do
      :get -> get(path)
      :delete -> delete(path)
    end
  end

  def call(http_method, path, data) do
    case http_method do
      :post -> post(path, data)
      :patch -> patch(path, data)
      :put -> put(path, data)
    end
  end

  def token do
    System.get_env("QUIP_TOKEN")
  end

  def get(path) do
    process_response HTTPoison.get(@base_url <> path, headers)
  end

  def post(path, data) do
    process_response HTTPoison.post(@base_url <> path, headers)
  end

  def patch(path, data) do
    process_response HTTPoison.patch(@base_url <> path, headers)
  end

  def put(path, data) do
    process_response HTTPoison.put(@base_url <> path, headers)
  end

  def delete(path) do
    process_response HTTPoison.delete(@base_url <> path, headers)
  end

  defp process_response(res) do
    case res do
      {:ok, %HTTPoison.Response{body: body}} -> parse_body(body)
    end
  end

  defp parse_body(body) do
    Poison.decode!(body)
  end

  defp headers do
    [authorization: ("Bearer " <> token)]
  end
end
