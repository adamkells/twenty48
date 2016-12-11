# frozen_string_literal: true

require 'minitest/autorun'

require_relative '../../lib/twenty48'

module CommonTestHelpers
  def assert_close(x, y)
    assert_in_delta x, y, 1e-6
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
    case state_array.size
    when 4 then Twenty48::State2.new(state_array)
    when 9 then Twenty48::State3.new(state_array)
    when 16 then Twenty48::State4.new(state_array)
    end
  end

  def make_builder(board_size, max_exponent)
    NativeBuilder.create(board_size, max_exponent)
  end
end
