# frozen_string_literal: true

require "test_helper"
require "clsx/phlex/helper"

class TestPhlexHelper < Minitest::Test
  # Mock Phlex class for testing
  class MockPhlexComponent
    include Clsx::Phlex::Helper
  end

  def test_phlex_helper_method_exists
    component = MockPhlexComponent.new
    assert_respond_to component, :clsx
  end

  def test_phlex_helper_with_string
    component = MockPhlexComponent.new
    assert_equal "foo bar", component.clsx("foo", "bar")
  end

  def test_phlex_helper_with_hash
    component = MockPhlexComponent.new
    assert_equal "foo baz", component.clsx({foo: true, bar: false, baz: true})
  end

  def test_phlex_helper_with_mixed_args
    component = MockPhlexComponent.new
    result = component.clsx("base", {active: true, disabled: false}, ["extra"])
    assert_equal "base active extra", result
  end
end
