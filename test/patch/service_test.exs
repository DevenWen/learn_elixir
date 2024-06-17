defmodule Patch.ServiceTest do
  use ExUnit.Case
  doctest Patch.Service
  alias Patch.Service
  use Patch

  describe "public_call/1" do
    test "returns :origin and the given arguments" do
      args = [:arg1, :arg2]
      assert Service.public_call(args) == {:origin, args}
    end

    test "returns patch return" do
      patch(Service, :public_call, fn args -> {:patch, args} end)
      args = [:arg1, :args2]
      assert Service.public_call(args) == {:patch, args}
    end
  end

  describe "public_call/2" do
    test "returns :origin and the given two arguments" do
      arg1 = :test_arg1
      arg2 = :test_arg2
      assert Service.public_call(arg1, arg2) == {:origin, arg1, arg2}
    end

    test "returns :patch and the given two arguments" do
      arg1 = :test_arg1
      arg2 = :test_arg2
      patch(Service, :public_call, fn arg1, arg2 -> {:patch, arg1, arg2} end)
      patch(Service, :public_call, fn arg1 -> {:patch, arg1} end)
      assert Service.public_call(arg1, arg2) == {:patch, arg1, arg2}
      assert Service.public_call(arg1) == {:patch, arg1}
    end
  end

  describe "public_call_private/1" do
    test "returns :origin, :private and the given arguments" do
      args = [:arg1, :arg2]
      assert Service.public_call_private(args) == {:origin, :private, args}
    end

    test "patch :private and the given arguments" do
      args = [:arg1, :arg2]
      patch(Service, :private_call, fn args -> {:patch, :private, args} end)
      assert Service.public_call_private(args) == {:patch, :private, args}
    end
  end

  test "asserting calls on a patch" do
    patch(String, :upcase, :patched)

    # Assertion passes after patching
    assert :patched = String.upcase("hello")

    # Assertion passes after call
    assert_called(String.upcase("hello"), 1)
  end

  test "patch mock value" do
    patch(Service, :public_call, cycle([1, 2, 3]))
    assert 1 == Service.public_call(1)
    assert 2 == Service.public_call(1)
    assert 3 == Service.public_call(1)

    patch(Service, :public_call, sequence([1, 2, 3]))
    assert 1 == Service.public_call(1)
    assert 2 == Service.public_call(1)
    assert 3 == Service.public_call(1)
    assert 3 == Service.public_call(1)

    patch(Service, :public_call, raises("patched"))

    assert_raise RuntimeError, "patched", fn ->
      assert 1 == Service.public_call(1)
    end
  end
end
