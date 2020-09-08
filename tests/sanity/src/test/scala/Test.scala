import org.scalatest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class ExampleSpec extends AnyFlatSpec with Matchers {
  "List.head" should "be the 0th index of a non-empty List" in {
    val xs = 1 :: 2 :: 3 :: Nil
    xs.head should equal (xs(0))
  }
}
