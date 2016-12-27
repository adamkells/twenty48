# frozen_string_literal: true

module Twenty48
  module CommonUnknownZerosResolverTests
    def test_moves_to_definite_win_2x2_to_4_resolve_0
      resolver = make_resolver(2, 2, 0)
      assert_nil moves_to_win(resolver, [
        0, 0,
        0, 0
      ])

      assert_nil moves_to_win(resolver, [
        0, 0,
        0, 1
      ])

      assert_nil moves_to_win(resolver, [
        0, 0,
        1, 1
      ])

      assert_equal 0, moves_to_win(resolver, [
        0, 0,
        0, 2
      ])
    end

    def test_moves_to_definite_win_2x2_to_4_resolve_1
      resolver = make_resolver(2, 2, 1)

      assert_nil moves_to_win(resolver, [
        0, 0,
        0, 0
      ])

      assert_nil moves_to_win(resolver, [
        0, 0,
        0, 1
      ])

      assert_equal 1, moves_to_win(resolver, [
        0, 0,
        1, 1
      ])

      assert_equal 1, moves_to_win(resolver, [
        1, 0,
        1, 1
      ])

      assert_equal 1, moves_to_win(resolver, [
        1, 1,
        1, 1
      ])
    end

    def test_moves_to_definite_win_2x2_to_8_resolve_0
      resolver = make_resolver(2, 3, 0)

      assert_nil moves_to_win(resolver, [
        0, 0,
        0, 1
      ])

      assert_nil moves_to_win(resolver, [
        0, 0,
        2, 2
      ])

      assert_equal 0, moves_to_win(resolver, [
        0, 0,
        0, 3
      ])
    end

    def test_moves_to_definite_win_2x2_to_8_resolve_1
      resolver = make_resolver(2, 3, 1)

      assert_nil moves_to_win(resolver, [
        0, 0,
        0, 1
      ])

      assert_nil moves_to_win(resolver, [
        0, 0,
        1, 1
      ])

      assert_equal 1, moves_to_win(resolver, [
        0, 0,
        2, 2
      ])

      # Need two moves to win.
      assert_nil moves_to_win(resolver, [
        1, 0,
        1, 2
      ])
    end

    def test_moves_to_definite_win_2x2_to_8_resolve_2
      resolver = make_resolver(2, 3, 2)

      assert_nil moves_to_win(resolver, [
        0, 0,
        1, 1
      ])

      assert_nil moves_to_win(resolver, [
        0, 0,
        1, 2
      ])

      assert_nil moves_to_win(resolver, [
        0, 1,
        1, 2
      ])

      assert_equal 1, moves_to_win(resolver, [
        0, 0,
        2, 2
      ])

      assert_equal 1, moves_to_win(resolver, [
        1, 1,
        2, 2
      ])

      assert_equal 1, moves_to_win(resolver, [
        1, 2,
        2, 2
      ])

      assert_equal 2, moves_to_win(resolver, [
        1, 0,
        1, 2
      ])

      assert_equal 2, moves_to_win(resolver, [
        1, 1,
        1, 2
      ])
    end

    def test_moves_to_definite_win_2x2_to_16_resolve_2
      resolver = make_resolver(2, 4, 2)

      assert_nil moves_to_win(resolver, [
        1, 1,
        2, 3
      ])
    end

    def test_moves_to_definite_win_2x2_to_16_resolve_3
      resolver = make_resolver(2, 4, 3)

      assert_equal 3, moves_to_win(resolver, [
        1, 1,
        2, 3
      ])
    end

    def test_moves_to_definite_win_3x3_to_8_resolve_1
      resolver = make_resolver(3, 3, 1)

      assert_nil moves_to_win(resolver, [
        0, 0, 0,
        0, 0, 0,
        0, 1, 1
      ])

      assert_equal 1, moves_to_win(resolver, [
        0, 0, 0,
        0, 0, 0,
        0, 2, 2
      ])

      assert_equal 1, moves_to_win(resolver, [
        0, 0, 0,
        0, 0, 0,
        2, 2, 0
      ])

      assert_equal 1, moves_to_win(resolver, [
        0, 2, 0,
        0, 2, 0,
        0, 0, 0
      ])
    end

    def test_moves_to_definite_win_3x3_to_8_resolve_2
      resolver = make_resolver(3, 3, 2)

      assert_equal 2, moves_to_win(resolver, [
        0, 0, 0,
        0, 0, 0,
        1, 1, 2
      ])

      assert_equal 2, moves_to_win(resolver, [
        0, 0, 0,
        1, 0, 0,
        1, 2, 0
      ])

      assert_equal 2, moves_to_win(resolver, [
        1, 0, 0,
        1, 0, 0,
        2, 0, 0
      ])

      assert_equal 2, moves_to_win(resolver, [
        0, 0, 0,
        0, 1, 0,
        0, 1, 2
      ])

      assert_equal 2, moves_to_win(resolver, [
        0, 0, 0,
        1, 1, 0,
        0, 2, 0
      ])

      assert_nil moves_to_win(resolver, [
        0, 0, 0,
        1, 0, 0,
        1, 0, 2
      ])
    end

    def test_moves_to_definite_win_3x3_to_16_resolve_2
      resolver = make_resolver(3, 4, 2)

      assert_nil moves_to_win(resolver, [
        0, 0, 0,
        1, 1, 3,
        0, 2, 0
      ])
    end

    def test_moves_to_definite_win_4x4_to_8_resolve_2
      resolver = make_resolver(4, 3, 2)

      #
      # If we move right, we end up with two adjacent 2s, but the exact state
      # after moving up or down in that position is unknown. We can however tell
      # that it's a win. This tripped up an earlier version of the heuristic.
      #
      assert_equal 2, moves_to_win(resolver, [
        0, 0, 0, 0,
        0, 0, 0, 2,
        0, 2, 0, 0,
        0, 0, 0, 0
      ])
    end

    def test_moves_to_definite_win_4x4_to_16_resolve_3
      resolver = make_resolver(4, 4, 3)

      assert_nil moves_to_win(resolver, [
        0, 0, 0, 0,
        0, 0, 0, 0,
        2, 0, 0, 3,
        2, 1, 2, 1
      ])

      assert_equal 1, moves_to_win(resolver, [
        0, 0, 0, 0,
        0, 0, 0, 1,
        3, 0, 0, 0,
        3, 0, 0, 0
      ])

      assert_equal 2, moves_to_win(resolver, [
        0, 0, 0, 0,
        0, 0, 0, 0,
        2, 0, 0, 2,
        0, 0, 0, 3
      ])

      #
      # This state is tricky. It is actually possible to win, but you have to
      # consider an "either or" argument. From
      #
      #    .    .    .    .
      #    .    .    .    2
      #    4    2    4    8
      #    .    4    2    4
      #
      # Go left. If the new tile is on the top line, you get a state like this,
      # and you can easily win in two (down and right).
      #
      #    .    .    .    2
      #    .    .    .    2
      #    8    4    2    4
      #    .    4    2    4
      #
      # However, if the new tile is in the corner below the 8, you get a state
      # like this one:
      #
      #    .    .    .    .
      #    .    .    .    2
      #    8    4    2    4
      #    2    4    2    4
      #
      # From there, you win in two by going up and right. This is beyond what
      # the heuristic can do.
      #
      assert_nil moves_to_win(resolver, [
        0, 0, 0, 0,
        0, 0, 0, 1,
        2, 1, 2, 3,
        0, 2, 1, 2
      ])
    end

    def test_exact_resolve_depth_3x3_to_8
      #
      # If we start from this state:
      # 0, 0, 0,
      # 0, 0, 1,
      # 1, 0, 2
      # and go left, we get
      # ?, ?, ?
      # 1, ?, ?
      # 1, 2, ?
      # Now, no matter what, we can win in two more moves (down and then left).
      # However, if the middle cell (for example) is 2^2, we can actually win in
      # one more move (down). This example imposes a limit on how many states
      # deep we can resolve and still have an exact value function. In
      # particular, we can only resolve exactly 2 moves ahead.
      #
      state = [
        0, 0, 0,
        0, 0, 1,
        1, 0, 2
      ]

      resolver_0 = make_resolver(3, 3, 0)
      assert_nil moves_to_win(resolver_0, state)

      resolver_1 = make_resolver(3, 3, 1)
      assert_nil moves_to_win(resolver_1, state)

      resolver_2 = make_resolver(3, 3, 2)
      assert_nil moves_to_win(resolver_2, state)

      # It's possible (but not certain), that we will win in 2 moves, even
      # though we'll definitely win in 3.
      resolver_3 = make_resolver(3, 3, 3)
      assert_equal 3, moves_to_win(resolver_3, state)
    end
  end
end
