require 'test_helper'

class NormalTest < Test::Unit::TestCase
  def test_trivial
    assert_equal 1, 1
  end
end

class EmTestHelperTest < Test::Unit::TestCase
  include EventMachine::TestHelper

  def test_trivial
    em do
      assert_equal 1, 1
      done
    end
  end

  def test_timer
    em do
      start = Time.now

      EM.add_timer(0.5){
        assert_in_delta 0.5, Time.now-start, 0.1
        done
      }
    end
  end
end

class EmTestTest < Test::Unit::TestCase
  include EventMachine::Test

  def test_working
    done
  end

  def test_timer
    start = Time.now

    EM.add_timer(0.5){
      assert_in_delta 0.5, Time.now-start, 0.1
      done
    }
  end

  def test_deferrable
    defr = EM::DefaultDeferrable.new
    defr.timeout(1)
    defr.errback{
      done
    }
  end
end

class EmTestWithTimeoutTest < Test::Unit::TestCase
  include EventMachine::Test

  default_timeout 2

  # if this test fails with RuntimeError: timeout exceeded
  # this is good and expected
  def test_should_fail_to_timeout
    EM.add_timer(3) {
      done
    }
  end
end

class EmTestWithTimeoutOverrideTest < Test::Unit::TestCase
  include EventMachine::Test

  default_timeout 2

  def test_timeout_override
    timeout(4)
    EM.add_timer(3) {
      done
    }
  end
end

class AnotherNormalTest < Test::Unit::TestCase
  def test_normal
    assert_equal 1, 1
  end
end

