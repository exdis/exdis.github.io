module Input exposing (input)

import Html exposing (Html, div, span, text, textarea)
import Html.Attributes exposing (class, property)

noBreakSpace : String
noBreakSpace = "\u{00A0}~\u{00A0}"

input : () -> Html ()
input model =
  div [ class "input" ]
      [ textarea [] []
      , div [ class "prompt" ]
        [ span [ class "bg" ] [ text noBreakSpace ]
        , text  "" ]
        ]

