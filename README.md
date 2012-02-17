About
=====

Simple TDD API for testing asynchronous EventMachine code. Extracted from em-spec.
(c) 2008 Aman Gupta (tmm1)

Usage
=====

There are two ways to use the Test::Unit extension.  To use it as a helper, include EM::TestHelper in your test unit class.  You then use the em method to wrap your evented test code.  Inside the em block, you must call #done after your expectations.  Everything works normally otherwise.

```ruby
  require 'em-test'

  class EmTestHelperTest < Test::Unit::TestCase

    include EventMachine::TestHelper

    def test_trivial
      em do
        assert_equal 1, 1
        done
      end
    end
  end
```

The other option is to include EM::Test in your test class.  This will patch Test::Unit so that all of your examples run inside an em block automatically:

```ruby
  require 'em-test'

  class EmTestTest < Test::Unit::TestCase

    include EventMachine::Test

    def test_timer
      start = Time.now

      EM.add_timer(0.5){
        assert_in_delta 0.5, Time.now-start, 0.1
        done
      }
    end
  end
```

