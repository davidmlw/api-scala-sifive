import org.scalatest.flatspec.AnyFlatSpec

class ExampleSpec extends AnyFlatSpec {
  "List.head" should "be the 0th index of a non-empty List" in {
    val xs = 1 :: 2 :: 3 :: Nil
    xs.head should equal (xs(0))
  }
}
