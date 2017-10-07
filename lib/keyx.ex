defmodule KeyX do
  @moduledoc """
  Documentation for KeyX.
  """

  @doc """
  Generate secret shares using Shamir's Secret Sharing alrgorithm.

  ## Parameters

    - K: specifies the number of shares necessary to recover the secret.
    - N: is the identifier of the share and varies between 1 and n where n is the total number of generated shares.
    - Secret: Binary (String) of raw secret to split `N` ways, requiring `K` shares to recover.


  ## Examples

      iex> KeyX.generate_shares(1,2, "super duper secret")
      {:ok, ["1-1-c3VwZXIgZHVwZXIgc2VjcmV0", "1-2-c3VwZXIgZHVwZXIgc2VjcmV0"]}

  """
  @spec generate_shares(k :: pos_integer, n :: pos_integer, secret :: String.t) :: nonempty_list(binary)
  defdelegate generate_shares(k,n,shares), to: RustySecretsNif


  @doc """
  Recover secrets from an appropriate number of shares. Must be equal or greater than the `K` parameters.

  ## Parameters

    - Shares: List of shares (Base64 encoding) containing information about the share, and if signed, the signature.

  ## Examples

      iex> KeyX.recover_secret(["1-2-c3VwZXIgZHVwZXIgc2VjcmV0", "1-2-c3VwZXIgZHVwZXIgc2VjcmV0"])
      {:ok, "super duper secret"}

  """
  @spec recover_secret(shares :: nonempty_list(String.t) ) :: binary
  defdelegate recover_secret(shares), to: RustySecretsNif

end
