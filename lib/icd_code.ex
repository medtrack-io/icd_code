defmodule IcdCode do
  @moduledoc """
  Documentation for IcdCode.
  """


  @doc """
    Get ICD definition with the given code
  """
  def get(code) do
    category = code |> String.slice(0..2)
    module = "Elixir.IcdCode.ICDCode.Codes_#{category}"
    function = "_#{code}"
    apply(String.to_atom(module), String.to_atom(function), [])
  end

  def get_category(code) do
    category = code |> String.slice(0..2)
    module = "Elixir.IcdCode.ICDCode.Codes_#{category}" |> String.to_atom()
    functions = apply(module, :__info__, [:functions])
    functions
    |> Enum.map(fn {f, _} ->
      apply(module, f, [])
    end)
    
  end

end
