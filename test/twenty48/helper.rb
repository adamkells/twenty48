# frozen_string_literal: true

require 'minitest/autorun'

require_relative '../../lib/twenty48'

module CommonTestHelpers
  def with_tmp_data
    Dir.mktmpdir do |tmp|
      yield Twenty48::Data.new(root: tmp)
    end
  end

  def assert_close(x, y)
    assert_in_delta x, y, 1e-6
  end

  def assert_nan(x)
    assert x.nan?, "expected #{x} to be NaN"
  end

  def make_states(state_arrays)
    state_arrays.map { |state_array| make_state(state_array) }
  end

  def assert_states_equal(expected_state_arrays, observed_states)
    assert_equal make_states(expected_state_arrays), observed_states
  end
end

class Twenty48Test < Minitest::Test
  include CommonTestHelpers

  # State constructor for Ruby state.
  def make_state(state_array)
    Twenty48::State.new(state_array)
  end

  def build_hash_model(builder, resolver)
    hash = {}
    builder.build(resolver) do |state, state_hash|
      hash[state] = state_hash
    end
    hash
  end
end

class Twenty48NativeTest < Minitest::Test
  include CommonTestHelpers

  def make_state(state_array)
    Twenty48::NativeState.create(state_array)
  end

  def make_resolver(board_size, max_exponent, max_win_depth)
    Twenty48::NativeResolver.create(board_size, max_exponent,
      max_lose_depth: max_win_depth, max_win_depth: max_win_depth)
  end

  def make_builder(board_size, max_exponent, max_lose_depth: 0,
    max_win_depth: 0)
    resolver = Twenty48::NativeResolver.create(board_size, max_exponent,
      max_lose_depth: max_lose_depth, max_win_depth: max_win_depth)
    Twenty48::NativeBuilder.create(board_size, resolver)
  end
end
