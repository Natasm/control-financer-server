defmodule ControlFinancerServer.UtilsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ControlFinancerServer.Utils` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{

      })
      |> ControlFinancerServer.Utils.create_category()

    category
  end
end
