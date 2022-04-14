defmodule ControlFinancerServer.UtilsTest do
  use ControlFinancerServer.DataCase

  alias ControlFinancerServer.Utils

  describe "categories" do
    alias ControlFinancerServer.Utils.Category

    import ControlFinancerServer.UtilsFixtures

    @invalid_attrs %{}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Utils.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Utils.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{}

      assert {:ok, %Category{} = category} = Utils.create_category(valid_attrs)
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Utils.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{}

      assert {:ok, %Category{} = category} = Utils.update_category(category, update_attrs)
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Utils.update_category(category, @invalid_attrs)
      assert category == Utils.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Utils.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Utils.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Utils.change_category(category)
    end
  end
end
