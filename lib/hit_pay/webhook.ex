defmodule HitPay.Webhook do
  @moduledoc """
  Service to verify HitPay's webhook
  """

  alias HitPay.Config

  require Logger

  def verify_webhook?(params) do
    Logger.debug(inspect(params))

    salt = Config.salt()
    stripped_params = strip_params(params)

    signature =
      :crypto.mac(:hmac, :sha256, salt, stripped_params) |> Base.encode16() |> String.downcase()

    Logger.debug("signature: #{inspect(signature)}")
    Logger.debug("hmac: #{inspect(params[~s(hmac)])}")

    Plug.Crypto.secure_compare(signature, params["hmac"])
  end

  defp strip_params(params) do
    Map.drop(params, ["hmac"])
    |> Map.put("reference_number", Map.get(params, "reference_number", ""))
    |> Enum.map(fn {k, v} -> {k, v} end)
    |> Enum.sort_by(&elem(&1, 0))
    |> Enum.reduce("", fn {k, v}, acc ->
      "#{acc}#{k}#{v}"
    end)
  end
end
