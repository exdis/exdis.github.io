module MainSpec exposing (..)

import Test exposing (Test)
import Expect


suite : Test
suite =
    Test.describe "Main test"
        [ Test.test "should be ok" <|
            \_ ->
                True
                    |> Expect.equal True ]
