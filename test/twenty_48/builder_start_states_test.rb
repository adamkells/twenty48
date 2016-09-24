# frozen_string_literal: true

require_relative 'helper'

class BuilderStartStateTest < Twenty48Test
  def test_start_states_2x2
    model = Twenty48::Builder.new(2, 3)
    assert_states_equal [
      [0, 0,
       1, 1],
      [0, 0,
       1, 2],
      [0, 0,
       2, 2],
      [0, 1,
       1, 0],
      [0, 1,
       2, 0],
      [0, 2,
       2, 0]
    ], model.start_states
  end

  def resolve_start_states(builder, max_resolve_depth = 0)
    resolver = Twenty48::UnknownZerosResolver.new(builder, max_resolve_depth)
    builder.start_states.map do |state|
      resolver.resolve(state)
    end.uniq.sort
  end

  def test_start_states_2x2_to_4_resolve_0
    builder = Twenty48::Builder.new(2, 2)
    assert_states_equal [
      [0, 0,
       0, 2], # the resolved win state
      [0, 0,
       1, 1],
      [0, 1,
       1, 0]
    ], resolve_start_states(builder)
  end

  def test_start_states_2x2_to_4_resolve_1
    builder = Twenty48::Builder.new(2, 2)
    assert_states_equal [
      [0, 0,
       0, 2], # the resolved win state
      [0, 0,
       1, 1], # actually the resolved 1-to-win state
      [0, 1,
       1, 0]
    ], resolve_start_states(builder, 1)
  end

  def test_start_states_2x2_to_8_resolve_1
    builder = Twenty48::Builder.new(2, 3)
    assert_states_equal [
      [0, 0,
       1, 1],
      [0, 0,
       1, 2],
      [0, 0,
       2, 2], # actually the resolved 1-to-win state
      [0, 1,
       1, 0],
      [0, 1,
       2, 0],
      [0, 2,
       2, 0]
    ], resolve_start_states(builder, 1)
  end
end
