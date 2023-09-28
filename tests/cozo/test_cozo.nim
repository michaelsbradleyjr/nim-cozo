import pkg/cozo
import pkg/unittest2

suite "cozo":
  test "should write some tests":
    check: cozo() == cozoImpl()
